Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA51702EC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3967E6EA95;
	Wed, 26 Feb 2020 15:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB3E6EA95
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582731822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pu8d76+nc64GiFbqamUGWNYqGBAtpCetHXieX3Kk89g=;
 b=bSIG0Fz5a9ZW/tphnrpXHfNlnBWboQZ1atb4JXD0JGKUF56YDy31qoOThxhfgk/hLYee8G
 E1qY/jyr3ffIv4VDYICeUSi+fybXBVtHYJwK2rdYRdGWzNCAuXMNDqeEy+M2vJ2LDSD27o
 +A1BUGYtbrOWYdiaFujzT5fHnR1ppdU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-Enj4m83qNlODNRqNOAcERA-1; Wed, 26 Feb 2020 10:43:36 -0500
X-MC-Unique: Enj4m83qNlODNRqNOAcERA-1
Received: by mail-wm1-f72.google.com with SMTP id b8so1224773wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 07:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pu8d76+nc64GiFbqamUGWNYqGBAtpCetHXieX3Kk89g=;
 b=bbpw5iHPSTK7hyWSVS2KIGrtIsLNSDCk9SxHTgcUesuVp9XbHCI+S4gws+mHS9pzSY
 2pD0yTJvhG1kdUS1fLPTIi8YkE5SADInbSqSdSzcLOO94zXGFGGdbOkdwE6AsiBuMS5V
 WQ2qqvCEmGR9SDU068tevH1YQtiPNzhWTf3HyF0wTIJNxINCizxH3PikOYxdLYqrzSm3
 eEvjBwTirHofJ0Xn2vdsJi2pYk3BNBFra5ieZX7klOPYjNffUGBiJU3U73Z6taMfTgv5
 10S+CnvohREwHAGa5m5kyrP3kxOneOu3ZDRxPcFupMdpzpFKub1befmVTmyh3k9S8klI
 02Pg==
X-Gm-Message-State: APjAAAWRzdpdz4IzUv8skSSfIKWSDO8+FD0fRB6o/2PW9h9zqcWLjIHN
 LXf+wX6oHbe7AdmIMIm2N74Zzi/SIk7cDOF6kFEq2YoznKkCJMPEdymkenXx8BMce3cjwnonp3b
 wPoLkcJnzlmU58loGpJTnHwMPT8qF
X-Received: by 2002:a5d:604c:: with SMTP id j12mr6071574wrt.162.1582731814487; 
 Wed, 26 Feb 2020 07:43:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxT/GtB5+yJHr7v5nKV4qGMOwpqh6/27Czbhhcvt9khD56pVGwoe5MXNG86dMyhpF0gOjg1xw==
X-Received: by 2002:a5d:604c:: with SMTP id j12mr6071558wrt.162.1582731814277; 
 Wed, 26 Feb 2020 07:43:34 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id t1sm3464482wrs.41.2020.02.26.07.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 07:43:33 -0800 (PST)
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
To: Alex Deucher <alexdeucher@gmail.com>
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
 <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <b0181c20-017b-7e3f-13c0-3ea5b98cadaa@redhat.com>
Date: Wed, 26 Feb 2020 16:43:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/26/20 4:29 PM, Alex Deucher wrote:
> On Wed, Feb 26, 2020 at 10:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Lyude and everyone else,
>>
>> Lyude I'm mailing you about this because you have done a lot of
>> work on DP MST, but if this rings a bell to anyone else feel
>> free to weigh in on this.
> 
> Might be a duplicate of:
> https://gitlab.freedesktop.org/drm/amd/issues/1052

Looks like you are right, reverting the commit which the bisect
from that issue points to:

cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic check")

Fixes the issue for me. I will add a comment to the issue.

Note I'm using integrated Intel gfx, so that means that this issue
definitely is not amdgpu specific.

Regards,

Hans




>> I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2 dock
>> as my daily rider for testing purposes. When 5.6-rc1 came out I
>> noticed that only 1 of the 2 1920x1080@60 monitors on the dock
>> lights up.
>>
>> There are no kernel errors in the logs, but mutter/gnome-shell says:
>>
>> gnome-shell[1316]: Failed to post KMS update: Page flip of 93 failed
>>
>> With 93 being the crtc-id of the crtc used for the monitor which is
>> displaying black. Since then I've waited for 5.6-rc3 hoping that a
>> fix was already queued up, but 5.6-rc3 still has this problem.
>>
>> gnome-shell does behave as if all monitors are connected, so the
>> monitor is seen, but we are failing to actually send any frames
>> to it.
>>
>> I've put a log collected with drm.debug=0x104 here:
>> https://fedorapeople.org/~jwrdegoede/drm-debug.log
>>
>> This message stands out as pointing to the likely cause of this problem:
>>
>> [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master transcoder: <invalid>
>>
>> Regards,
>>
>> Hans
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
