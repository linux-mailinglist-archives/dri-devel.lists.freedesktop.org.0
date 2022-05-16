Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B8D52850C
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EFE10FD9E;
	Mon, 16 May 2022 13:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AEE10FD99
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652706774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LQHsX37tf2+STKOZVa9TGMMSxaD1Yn7cwu7KTGclJUE=;
 b=ELlRj8k1knvEbZac7E4LINBXRKnDMxR7l6HYZRLT6Cft09r4VwfPsZwCBVS5ndDucnsue4
 DCSRJl55aWZ1W4Dq4Cg0SryuX6PHY0qcNyhxj5d9kwulf9sQtcsY3jE6ZUcz5xOGQwVHMB
 Bpzpx+CKCIIo7peol3KL6vjpHDbTFlo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-FM7uT7xzObq7fwMVntOGJw-1; Mon, 16 May 2022 09:12:53 -0400
X-MC-Unique: FM7uT7xzObq7fwMVntOGJw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so5626066wmi.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 06:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LQHsX37tf2+STKOZVa9TGMMSxaD1Yn7cwu7KTGclJUE=;
 b=o95MhKPRoalYS/O7x1Qc0fJ+fox86vmRtU9YepsmnSLIKkxqtAF/rqITdbdYWKbeAZ
 LNHVNBQMRGs0ax0sqRIBTTbqbzV0bYNfeKDLcMTRKT3/9cQ/sEsKZimlYVDRCC0EP3fM
 4VquawLDefiARCsxO4fFM8IuxUclby6pGwCXXsJlLPW+SAG8d20wYiDSugNF3boXlwoc
 8OV3J4BMr91j0p4e5GcD1M7xAsOxFPRnmlqGrHPgGl5P6HwqDJd8HWqmTxLCI3QLF+P/
 uZ/OKSbcTEETvg01XGkqFlbVH4oeH8e6uKReK8tzNpLr3WSbrE+vKVK83xsEhBtvUjP4
 0utw==
X-Gm-Message-State: AOAM530N2es3ui8FJRrrPu+JoMx8G0RqV1p1KoWuvKHyR+kMhKTpSsa4
 79DxprxgpXrDhKfC/dkIe64s1P1QVcs6oEaL8+0/I/qZ4AOzMu8zusYtHTo1ZXL2BA70GFu0Cvr
 79vN/Jh+9laaWQ//fFCD9/bdvbQa7
X-Received: by 2002:a5d:64c6:0:b0:20c:6ffb:9584 with SMTP id
 f6-20020a5d64c6000000b0020c6ffb9584mr13617512wri.156.1652706772609; 
 Mon, 16 May 2022 06:12:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuQI0ox9wPgSMiwTCMuoGyvK64anVHZWbcIlZVK5Apdt/IGcgaFC7hWen4gdqM2AXZXz7F+A==
X-Received: by 2002:a5d:64c6:0:b0:20c:6ffb:9584 with SMTP id
 f6-20020a5d64c6000000b0020c6ffb9584mr13617502wri.156.1652706772460; 
 Mon, 16 May 2022 06:12:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 b2-20020adfc742000000b0020c5253d90csm9567033wrh.88.2022.05.16.06.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 06:12:51 -0700 (PDT)
Message-ID: <ba3bbcdc-7e82-5f37-a12c-434f03ccc4d9@redhat.com>
Date: Mon, 16 May 2022 15:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/3] mgag200: Improve damage handling
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 lyude@redhat.com
References: <20220504134026.283417-1-jfalempe@redhat.com>
 <c54fe066-27df-f317-0613-a7f20168508f@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c54fe066-27df-f317-0613-a7f20168508f@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05/2022 16:59, Thomas Zimmermann wrote:
> Hi Jocelyn,
> 
> with my comment on 3/3 considered, you can add
> 
> Reviewed-by: Thomas Zimemrmann <tzimemrmann@suse.de>
> 
> to this patchset.
> 
> You should get commit access for drm-misc, so that you can land the 
> patchset on your own. Please see
> 
>    https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html
> 
> for how to do that.

I pushed the patches with the requested changes to drm-misc-next last 
Thursday.

Thanks a lot for your help.

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
> Am 04.05.22 um 15:40 schrieb Jocelyn Falempe:
>> mgag200: Improve damage handling
>>
>> This series improves the damage handling on Matrox gpu, and allows
>> Gnome/Wayland to run much better.
>> Also include some driver cleanup.
>>
>> Tested on a Dell T310 with Matrox MGA G200eW WPCM450 (rev 0a)
>>
>> v2:
>>   Drop remove mgag200_probe_vram()
>>   Rewrote the patch to warn if startaddr is not 0, and hw doesn't
>>    support it. (instead of removing the unused flag).
>>
>> Thanks,
>>
> 

