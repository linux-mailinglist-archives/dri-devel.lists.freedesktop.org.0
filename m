Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199402611F2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 15:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6B56E823;
	Tue,  8 Sep 2020 13:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A9A6E029
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599571228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kk/MzQpl2YW+BRjUs+jKB6CtH3juIQy3EW0uS3+0BVs=;
 b=VVhCXbtogALha8HgF/EJvCIEP9bsyIT6TZjXycVfa64aMJAzcohRF5XT2gdXC6QxQGJRTP
 Sqh//fLGBt8dRs1jPvLaxzgrlC51nSszh0N2bjzZ/3Z6STs40UfW6+m2CfqEkz38hBApUo
 GXS2NuuqfbGSARk4yyZzK6K0PZOueqw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-RkS7nkdjN4SEa8vZ4shUHg-1; Tue, 08 Sep 2020 09:20:27 -0400
X-MC-Unique: RkS7nkdjN4SEa8vZ4shUHg-1
Received: by mail-ed1-f70.google.com with SMTP id n25so6182802edr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 06:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kk/MzQpl2YW+BRjUs+jKB6CtH3juIQy3EW0uS3+0BVs=;
 b=jx1tu8HGNqiY3pLltMglAYSdY7eqJeQRlgJg5ZmWmiTY5zPdSj9tBjWRbyec/p4CVe
 0cJMZ7HzmBcXtN1pdpWt22nMzoPOLKDJw70SMO77Yd/otsY5tXt5x8cTXEz3JYPFl1nU
 mu0IyekyGMM8O8q3LKylFXXolDLcBa/zpbr9S+IEYTLg2HZMBnHWbiPywFBl6+OwZVFS
 8P/ZMX8wba2S9eJQjn2K++vaYOp1D5JFlnotglGK6hUPGpTewTJH0R94mPTCQnSek+ly
 YRBow+dRKD7DvsAcVaRmjlHaVhMax2flmVUQr26/lXWs7zc8UbZZzuaPo/3KUGXF6YsM
 IYgQ==
X-Gm-Message-State: AOAM533Vjd7mu23wP0zw5ZvL1YtQlEIZKiIBjuge9q9l7cex+Uc1fk+M
 CvJxE6tSqDC05cvT7EznwFY9wKGLEunASKgnqVBr6W2psxsBVEbdVUFVysttkNCk8uqCwrwsrv+
 wM3hhNB857N4wtmc3TjILdctuvarP
X-Received: by 2002:aa7:d697:: with SMTP id d23mr27729545edr.13.1599571225487; 
 Tue, 08 Sep 2020 06:20:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJSCXKpUVVYMUY6y6pGIlWBQF6oylam73BShkdtH0Ngf5e1fkNihiTDrhP7Zi2Gs3qSlHKgQ==
X-Received: by 2002:aa7:d697:: with SMTP id d23mr27729530edr.13.1599571225337; 
 Tue, 08 Sep 2020 06:20:25 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id n11sm14190638ejs.38.2020.09.08.06.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 06:20:24 -0700 (PDT)
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20200908140022.67dd3801@canb.auug.org.au>
 <db369f50-a3a0-2504-0628-ce5e6780d31b@redhat.com>
 <20200908210449.1a4f8e52@canb.auug.org.au>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d5c2cb83-8fc0-069e-7d4b-64a8ecf9a6b4@redhat.com>
Date: Tue, 8 Sep 2020 15:20:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908210449.1a4f8e52@canb.auug.org.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/8/20 1:04 PM, Stephen Rothwell wrote:
> Hi Hans,
> 
> On Tue, 8 Sep 2020 10:22:06 +0200 Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> On 9/8/20 6:00 AM, Stephen Rothwell wrote:
>>>
>>> Today's linux-next merge of the drm-intel tree got a conflict in:
>>>
>>>     drivers/gpu/drm/i915/display/intel_panel.c
>>>
>>> between commit:
>>>
>>>     f8bd54d21904 ("drm/i915: panel: Use atomic PWM API for devs with an external PWM controller")
> 
> This should have been
> 
>    899c537c25f9 ("drm/i915: Use 64-bit division macro")

Yes that makes more sense.

>>> from Linus' tree and commit:
>>>
>>>     6b51e7d23aa8 ("drm/i915: panel: Honor the VBT PWM frequency for devs with an external PWM controller")
>>
>> That doesn't sound correct, those are both commits from the drm-intel tree.
>>
>>> from the drm-intel tree.
>>>
>>> I fixed it up (I just used the latter)
>>
>> Just taking the drivers/gpu/drm/i915/display/intel_panel.c contents of:
>>
>> f8bd54d21904 ("drm/i915: panel: Use atomic PWM API for devs with an external PWM controller")
>>
>> Is the right thing to do, the problem is a difference in a line which gets
>> removed in that commit.
> 
> Which is what I actually did, I guess :-)

Yes, looks good.

> Sorry about that.

No problem and thank you for all the work you do on -next.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
