Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5DA576F38
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0483E1121A0;
	Sat, 16 Jul 2022 14:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C40710E275
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 20:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657916686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puUwKs/uapaCvqGKE4ZR+Eb1cZy4rC5wzi3H3IGXfKc=;
 b=KfuxC1IvgVBTexxC2sKHr58/ucU1ilbPF7CtRurAwtQa6tkWsyRg+R7Dhkve6/4Bx6BceV
 LlFC8foT8wMMptIbJcRXbWU445j8DCko4WBbhVuZsZnN0ygJHmQnAPN0xi3JiW3TpHORF5
 CNffQO9mINl2+IyAJxkKt5tHURoZ850=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-KbO3ffiVPk2vrHXZDoQ_Bg-1; Fri, 15 Jul 2022 16:24:45 -0400
X-MC-Unique: KbO3ffiVPk2vrHXZDoQ_Bg-1
Received: by mail-qk1-f200.google.com with SMTP id
 l15-20020a05620a28cf00b006b46997c070so4262869qkp.20
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 13:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=puUwKs/uapaCvqGKE4ZR+Eb1cZy4rC5wzi3H3IGXfKc=;
 b=LYoPaBGwVq4s8vZk+vtFb0dn/G9sJvJFaU6c/uj34s21pyTiIhgxb3mRvWRjySEbGk
 v5RnLJ0AINP2MEZ9Qt3b1QPunlq4Gqfx2Q5uXGg8pU1mB0xTGUSqYNgCpSMt7fh/+/X5
 o7oUuSyzETt80l688KwaVV0eE/Pdt2YjUsWXlCVjg+I/QcxQNL09Xb4W6Ekonnf+03LZ
 odmWhTv4mxs6DM85yW7oQqTOHlZpo0FiAhbSH9hzkUyVm/UZs/XmyIWVqxbm7c17QuNt
 yRt30lpH3uZL79yYsN5Z+3p4ztLM91j/CG0UzCcmDdebbXdFX0a1jWclvpiPAMr4ZER+
 Tdug==
X-Gm-Message-State: AJIora/2HoBPp35KW9ymtnhaPN++AE8+WkNH+pwFeidOeNuXt9VqmQvU
 fKkVJdGLWKmLhXVH7DV++s/NYli4Rftc5x0IV1bfAyquxE/pTcK4voYYnVFPbg7chZ514dKDuYA
 6f69irs2HUuJ8qVuxVVz0ho0Pl9FB
X-Received: by 2002:a05:622a:144:b0:31d:428a:fdd5 with SMTP id
 v4-20020a05622a014400b0031d428afdd5mr13554029qtw.529.1657916684933; 
 Fri, 15 Jul 2022 13:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v+kDYEmsZNCpJqhElMCI/kiibn3wjaahXsdxbRBjTE40s0SJKRoLNwukwRh59sXFKQjnDR0g==
X-Received: by 2002:a05:622a:144:b0:31d:428a:fdd5 with SMTP id
 v4-20020a05622a014400b0031d428afdd5mr13554013qtw.529.1657916684720; 
 Fri, 15 Jul 2022 13:24:44 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 s27-20020a05622a1a9b00b0031d3996d304sm4516821qtc.17.2022.07.15.13.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 13:24:44 -0700 (PDT)
Subject: Re: [PATCH] drm/nouveau/bios: set info only when the return is not 0
To: Lyude Paul <lyude@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com
References: <20220702153904.1696595-1-trix@redhat.com>
 <91194b7190081545a8eeb10d20e24de864dfe259.camel@redhat.com>
 <44d6fc01654b16f9cdd6b517999ddec76038d547.camel@redhat.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <e21c527b-9f58-25ba-ce00-1bfccf048d1e@redhat.com>
Date: Fri, 15 Jul 2022 13:24:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <44d6fc01654b16f9cdd6b517999ddec76038d547.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/15/22 12:09 PM, Lyude Paul wrote:
> On Mon, 2022-07-04 at 17:32 -0400, Lyude Paul wrote:
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>
>> Currently on flakey internet in the back of a car, so I probably won't be
>> able
>> to push this until I get back tonight or early tomorrow
> Whoops! Slipped my mind when I got back, but I just remembered it now so I
> will go ahead and push :). apologies for the delay!

Thanks!

T

>
>> On Sat, 2022-07-02 at 11:39 -0400, Tom Rix wrote:
>>> clang static analysis reports
>>> drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c:68:17: warning: The right
>>> operand of '*' is a garbage value [core.UndefinedBinaryOperatorResult]
>>>          switch (!!data * *ver) {
>>>                         ^ ~~~~
>>> A switch statement with only a default should be reduced to an if.
>>>
>>> If nvbios_pmuEp() returns 0, via the data variable, the output info
>>> parameter
>>> is not used.  So set info only when data is not 0.
>>>
>>> The struct nvbios_pmuE only has the type and data elements.  Since both of
>>> these
>>> are explicitly set, memset is not needed.  So remove it.
>>>
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> ---
>>>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c | 5 +----
>>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
>>> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
>>> index b4a308f3cf7b..49e2664a734c 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
>>> @@ -64,12 +64,9 @@ nvbios_pmuEp(struct nvkm_bios *bios, int idx, u8 *ver,
>>> u8
>>> *hdr,
>>>               struct nvbios_pmuE *info)
>>>   {
>>>          u32 data = nvbios_pmuEe(bios, idx, ver, hdr);
>>> -       memset(info, 0x00, sizeof(*info));
>>> -       switch (!!data * *ver) {
>>> -       default:
>>> +       if (data) {
>>>                  info->type = nvbios_rd08(bios, data + 0x00);
>>>                  info->data = nvbios_rd32(bios, data + 0x02);
>>> -               break;
>>>          }
>>>          return data;
>>>   }

