Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F219A1727D2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBA06EC6C;
	Thu, 27 Feb 2020 18:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5BF6EC6C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582828975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QGik/J/WcfaVoBVSbXrBoWkxtu9eoRljDYOd/ANZc8=;
 b=NqVgrM4UIm/2NPT4PZfGRyF8BBBzNmmmUB2ObAEDFJvRCam2UuTkds31ptT5Rj1bHI36hj
 nPnu/2A7wE5sdYLwQuoDb6NhKktA3Covl8imJ/pxYpbSLBYox/XcUjdX59RJ+Jw19pRrh0
 Hl0k5huTZS0s0rT2LTbFvh69hwy4+4g=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-WXc6-Uw3Odihyemxesn1Rw-1; Thu, 27 Feb 2020 13:42:52 -0500
X-MC-Unique: WXc6-Uw3Odihyemxesn1Rw-1
Received: by mail-qt1-f198.google.com with SMTP id z25so338161qto.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=/QGik/J/WcfaVoBVSbXrBoWkxtu9eoRljDYOd/ANZc8=;
 b=eQLKywZoPlw7bF2yphXrYfQKcjc4xpO6MA66Dygojk1rqbdiGKhShlRopoXZ2q9amB
 Zk7SLE0jUaIU0rG+zF24ayTl6WITmSkJY1rCkTtzUb9esrAXjoDOH1QOULsi3FLnw/Vc
 zWOgqXQV9Co7nLd/qUU3VgQBEAmeacZ8nR0UaIqmqkMtQw+cQ4tEwsHNjXcpKeuHtBQO
 SWw5ZG8jq0EbPm48A4pJyKlYErvOyWpLkqx1upWmyhzaKFATLJG80khdSV/m6QrHRl4X
 R+4EAWNr8afwEGOqXPseevdei1lmILdb6lfXadNlmCCLavDf4MM+JJ4XxevAu5oupcbo
 efjg==
X-Gm-Message-State: APjAAAVbWIpC0hpoClfN0lEuZ7jK3piSJG6jfIqaTFgoRvrnYcQvrOkF
 I8YRilIifUTmGxIUneDGDjd2nqo5g5iYr1ONb22ShyRVz5UWzKCFoikp7faN/lILgSOvkDLmHgP
 U6e4f//IwIJ9SwwkpL1EitM3RVKaI
X-Received: by 2002:ac8:6697:: with SMTP id d23mr547172qtp.235.1582828971863; 
 Thu, 27 Feb 2020 10:42:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJuQKD1HUczA95zdFvzelbf6A052NG0AX0pKvruHKpzzck2E8k/T6VYK+pr6GY1sA+607tBA==
X-Received: by 2002:ac8:6697:: with SMTP id d23mr547147qtp.235.1582828971436; 
 Thu, 27 Feb 2020 10:42:51 -0800 (PST)
Received: from dhcp-10-20-1-196.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id s13sm3634468qke.67.2020.02.27.10.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:42:50 -0800 (PST)
Message-ID: <da4d5a54c4bd0c934b9539c3106cece7ae81036d.camel@redhat.com>
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
From: Lyude Paul <lyude@redhat.com>
To: Mikita Lipski <mlipski@amd.com>, "Souza, Jose" <jose.souza@intel.com>, 
 "hdegoede@redhat.com"
 <hdegoede@redhat.com>, "mikita.lipski@amd.com" <mikita.lipski@amd.com>, 
 "alexdeucher@gmail.com"
 <alexdeucher@gmail.com>, "Lin, Wayne" <Wayne.Lin@amd.com>
Date: Thu, 27 Feb 2020 13:42:49 -0500
In-Reply-To: <00510d21-f308-a75e-c0b6-3fd3b1ad4a13@amd.com>
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
 <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
 <b0181c20-017b-7e3f-13c0-3ea5b98cadaa@redhat.com>
 <CADnq5_MjaOD+QrupjQwjdu-MgVZm1sg1x9=4uxdv92u1xuSdvQ@mail.gmail.com>
 <77b812d5-5b87-49b7-87dc-16d50a5666df@redhat.com>
 <06d506c1449a59a422fd9f246c7ed9d299139cf9.camel@intel.com>
 <00510d21-f308-a75e-c0b6-3fd3b1ad4a13@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-02-27 at 10:04 -0500, Mikita Lipski wrote:
> 
> On 2/26/20 6:41 PM, Souza, Jose wrote:
> > Hi Hans
> > 
> > Just commenting in the "[    3.309061] [drm:intel_dump_pipe_config
> > [i915]] MST master transcoder: <invalid>" message, it is the expected
> > behaviour for anything older than Tigerlake, from TGL+ this will be set
> > in MST mode.
> > 
> > On Wed, 2020-02-26 at 18:52 +0100, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 2/26/20 5:05 PM, Alex Deucher wrote:
> > > > On Wed, Feb 26, 2020 at 10:43 AM Hans de Goede <hdegoede@redhat.com
> > > > > wrote:
> > > > > Hi,
> > > > > 
> > > > > On 2/26/20 4:29 PM, Alex Deucher wrote:
> > > > > > On Wed, Feb 26, 2020 at 10:16 AM Hans de Goede <
> > > > > > hdegoede@redhat.com> wrote:
> > > > > > > Hi Lyude and everyone else,
> > > > > > > 
> > > > > > > Lyude I'm mailing you about this because you have done a lot
> > > > > > > of
> > > > > > > work on DP MST, but if this rings a bell to anyone else feel
> > > > > > > free to weigh in on this.
> > > > > > 
> > > > > > Might be a duplicate of:
> > > > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2Fissues%2F1052&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=AKmPhCqvvKtgzDBaobU4g74bErQQ7O3aL%2FJ8Al2Ey2I%3D&amp;reserved=0
> > > > > 
> > > > > Looks like you are right, reverting the commit which the bisect
> > > > > from that issue points to:
> > > > > 
> > > > > cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST
> > > > > atomic check")
> > > > > 
> > > > > Fixes the issue for me. I will add a comment to the issue.
> > > > > 
> > > > > Note I'm using integrated Intel gfx, so that means that this
> > > > > issue
> > > > > definitely is not amdgpu specific.
> > > > > 
> > > > 
> > > > I'm not too familiar with the mst code, but I wonder if we were
> > > > exceeding the bandwidth limits in some setups and it just happened
> > > > to
> > > > work, but now that we enforcing them, they don't which is correct,
> > > > but
> > > > a regression from some users' perspective?
> > > 
> > > I seriously doubt that is the case according to:
> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsupport.lenovo.com%2Fnl%2Fen%2Fsolutions%2Fpd029622&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=64uP50QojK2HkemDq3EGNKCVEgVl1ZxucyI%2F%2Bkk2Ng0%3D&amp;reserved=0
> > > 
> > > The gen 2 tb3 dock can handle 2 external
> > > displays at 3840*2160@60Hz together with the internal
> > > panel being on and both my external displays run at
> > > 1920x1080@60 so I'm consuming less then half of the
> > > maximum bandwidth.
> > > 
> > > There definitely is a bug somewhere in the
> > > cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST
> > > atomic check")
> > > commit (or somewhere else and triggered by that commit).
> > > 
> > > Regards,
> > > 
> > > Hans
> 
> + Lin Wyane, Lyude Paul
> 
> Hi,
> 
> Sorry I'm late responding to the thread.
> The reason why this issue could have missed is because this patch was 
> pushed as a part of DSC MST patch series and with DSC the pbn is much 
> lower so it wouldn't fail this check.
> 
> Anyways this check might have exposed a different bug in DRM. It seems 
> like the variable of available_pbn doesn't get updated on the ports in 
> the topology so the calculation of branch's bandwidth limit is not 
> correct, which would cause a branch bandwidth to be bottle-necked by 
> pbn_limit variable.
>  From DP 1.4 standart it seems like DRM should update available_pbn on 
> each port, when processing RESOURCE_STATUS_NOTIFY sideband message when 
> topology changes. Right now DRM doesn't seem to be doing anything about 
> it. Was it the intention, or has it just never implemented? If it the 
> intention, then the patch should be reverted till a new solution is 
> delivered, otherwise it should be treated as a bug exposed by a branch 
> bandwidth check.
> I would appreciate any suggestions.

This was definitely something on my to-do list to implement but I never got
around to it, and your explanation of the problem makes perfect sense to me so
this would probably be the place to start. Thanks for looking into this while
I was gone!

> 
> Thanks,
> Mikita
> 
> > > 
> > > 
> > > 
> > > 
> > > 
> > > 
> > > > Alex
> > > > 
> > > > 
> > > > > Regards,
> > > > > 
> > > > > Hans
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > > > I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2
> > > > > > > dock
> > > > > > > as my daily rider for testing purposes. When 5.6-rc1 came out
> > > > > > > I
> > > > > > > noticed that only 1 of the 2 1920x1080@60 monitors on the
> > > > > > > dock
> > > > > > > lights up.
> > > > > > > 
> > > > > > > There are no kernel errors in the logs, but mutter/gnome-
> > > > > > > shell says:
> > > > > > > 
> > > > > > > gnome-shell[1316]: Failed to post KMS update: Page flip of 93
> > > > > > > failed
> > > > > > > 
> > > > > > > With 93 being the crtc-id of the crtc used for the monitor
> > > > > > > which is
> > > > > > > displaying black. Since then I've waited for 5.6-rc3 hoping
> > > > > > > that a
> > > > > > > fix was already queued up, but 5.6-rc3 still has this
> > > > > > > problem.
> > > > > > > 
> > > > > > > gnome-shell does behave as if all monitors are connected, so
> > > > > > > the
> > > > > > > monitor is seen, but we are failing to actually send any
> > > > > > > frames
> > > > > > > to it.
> > > > > > > 
> > > > > > > I've put a log collected with drm.debug=0x104 here:
> > > > > > > https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Ffedorapeople.org%2F~jwrdegoede%2Fdrm-debug.log&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=eHPlfCRZXIPp9O%2B9CHvwb1kg5ffIhO%2FFFgwTcuWFKHM%3D&amp;reserved=0
> > > > > > > 
> > > > > > > This message stands out as pointing to the likely cause of
> > > > > > > this problem:
> > > > > > > 
> > > > > > > [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master
> > > > > > > transcoder: <invalid>
> > > > > > > 
> > > > > > > Regards,
> > > > > > > 
> > > > > > > Hans
> > > > > > > 
> > > > > > > _______________________________________________
> > > > > > > dri-devel mailing list
> > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=im2LrBE%2BgjCL%2FN4%2B%2BZOOu6Eci5SuaZrT8l3mOuDRQH0%3D&amp;reserved=0
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=im2LrBE%2BgjCL%2FN4%2B%2BZOOu6Eci5SuaZrT8l3mOuDRQH0%3D&amp;reserved=0
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
