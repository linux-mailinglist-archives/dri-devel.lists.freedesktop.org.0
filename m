Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F5217C930
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 00:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8896D6EDAA;
	Fri,  6 Mar 2020 23:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6626EDAA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 23:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583538885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0K5QDFeKgplPdbYfM9NaqTf1TFgxxJAitJmeiSzRLc=;
 b=ULlMBAq3YR7emkLP70FHRX4DckzfcJBEqzpe+uL+b19DrPxoBit695mvhc0GttTMUIDcK4
 tuhkNeidWJbpwE2SsxuwI2UT4gjfqn9/QYFeCcnQ1cm6XLI1Ccy3vGvGnomIMObxuJxc92
 SaJt+TuLdMPindm0pW3t2Ws2w07AJT8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-XC2s4sCQN8OeV9qXFSKU_w-1; Fri, 06 Mar 2020 18:54:40 -0500
X-MC-Unique: XC2s4sCQN8OeV9qXFSKU_w-1
Received: by mail-qt1-f199.google.com with SMTP id i6so2558886qtw.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 15:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=v0K5QDFeKgplPdbYfM9NaqTf1TFgxxJAitJmeiSzRLc=;
 b=LE7g/ZHxVXwa8FE3ajW1ifRWLvHnBwsEQYCaWliiJs5v1vy1E1dpDmquA5jV+hqVI4
 cbk7l1Y+VO/jPEhkEwixbdyLCI0MfcQ+u/LCvS8C0jr1ilcOBlRJ0R0UWWrJRD9et2y0
 Y67YsULWuhTXgADy9TtEh0bOXSZaxvR8k2yJCvHnEWgEIZrXgwlZJ9wS/P4g4fc/+U62
 x92kLLh4w3swzZKAFN9Aso9yDtrLs6har37aYGWnQSs7J6fpwyE6DrYf9MFpaHjyIsDb
 rNQzCGBqOK2pyPl3JwqoqnShNCDFm2sDaOUW+39KnX6JyyqojDcX1ZYkvWm9Kq4r8ueI
 oNTg==
X-Gm-Message-State: ANhLgQ2P4TEqEx6GBcDoqoNOq0e3BUtc+yPlgcEsHGCpBuYzkZ730p48
 3inNkDT5NKFx68gc/U5rN/qyO36W0znmKOl6pHgR7vym77kk+cuW1cBShiNnHw6p/m1hkPiB8Nv
 GVBj/PGU4PR2/osRWy/JqUVb2LE74
X-Received: by 2002:a37:a1cc:: with SMTP id k195mr5437766qke.169.1583538879649; 
 Fri, 06 Mar 2020 15:54:39 -0800 (PST)
X-Google-Smtp-Source: ADFU+vscqNb2q09thk4RGKHSiHoinHtpHvvInwPn9aMp5gCYVMOuHWb6I7K7veuK0ZsHmBShdeQPjA==
X-Received: by 2002:a37:a1cc:: with SMTP id k195mr5437752qke.169.1583538879335; 
 Fri, 06 Mar 2020 15:54:39 -0800 (PST)
Received: from dhcp-10-20-1-196.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id k202sm5569970qke.134.2020.03.06.15.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 15:54:38 -0800 (PST)
Message-ID: <aebf675d3c44ed6dc6db670067503a32113ebce9.camel@redhat.com>
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Alex Deucher
 <alexdeucher@gmail.com>,  "Lipski, Mikita" <mikita.lipski@amd.com>
Date: Fri, 06 Mar 2020 18:54:37 -0500
In-Reply-To: <77b812d5-5b87-49b7-87dc-16d50a5666df@redhat.com>
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
 <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
 <b0181c20-017b-7e3f-13c0-3ea5b98cadaa@redhat.com>
 <CADnq5_MjaOD+QrupjQwjdu-MgVZm1sg1x9=4uxdv92u1xuSdvQ@mail.gmail.com>
 <77b812d5-5b87-49b7-87dc-16d50a5666df@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-02-26 at 18:52 +0100, Hans de Goede wrote:
> Hi,
> 
> On 2/26/20 5:05 PM, Alex Deucher wrote:
> > On Wed, Feb 26, 2020 at 10:43 AM Hans de Goede <hdegoede@redhat.com>
> > wrote:
> > > Hi,
> > > 
> > > On 2/26/20 4:29 PM, Alex Deucher wrote:
> > > > On Wed, Feb 26, 2020 at 10:16 AM Hans de Goede <hdegoede@redhat.com>
> > > > wrote:
> > > > > Hi Lyude and everyone else,
> > > > > 
> > > > > Lyude I'm mailing you about this because you have done a lot of
> > > > > work on DP MST, but if this rings a bell to anyone else feel
> > > > > free to weigh in on this.
> > > > 
> > > > Might be a duplicate of:
> > > > https://gitlab.freedesktop.org/drm/amd/issues/1052
> > > 
> > > Looks like you are right, reverting the commit which the bisect
> > > from that issue points to:
> > > 
> > > cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic
> > > check")
> > > 
> > > Fixes the issue for me. I will add a comment to the issue.
> > > 
> > > Note I'm using integrated Intel gfx, so that means that this issue
> > > definitely is not amdgpu specific.
> > > 
> > 
> > I'm not too familiar with the mst code, but I wonder if we were
> > exceeding the bandwidth limits in some setups and it just happened to
> > work, but now that we enforcing them, they don't which is correct, but
> > a regression from some users' perspective?
> 
> I seriously doubt that is the case according to:
> https://support.lenovo.com/nl/en/solutions/pd029622
> 
> The gen 2 tb3 dock can handle 2 external
> displays at 3840*2160@60Hz together with the internal
> panel being on and both my external displays run at
> 1920x1080@60 so I'm consuming less then half of the
> maximum bandwidth.

OK-so I wasn't actually able to reproduce this issue with my setup (I've got a
X1 Carbon 7th generation, but I don't have the 2nd generation dock - only the
first generation dock) but I'm certain I've actually fixed it now, since I
realized we did not have a very good understanding of how PBN limitations are
advertised with MST. I rewrote the bandwidth checks again, and in the process
also found a much more subtle regression that got introduced in 5.6, which
would sometimes cause MST probing to appear to just stop in it's tracks with
no messages.

I cc'd both patch series to you, so I'd recommend applying them both onto your
kernel and seeing if that fixes your issues. If it still doesn't, then get me
some kernel logs with:

drm.debug=0x116 log_buf_len=50M

And I'll take a closer look. I'm pretty confident this should fix everything
though :)

> 
> There definitely is a bug somewhere in the
> cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic
> check")
> commit (or somewhere else and triggered by that commit).
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> 
> > Alex
> > 
> > 
> > > Regards,
> > > 
> > > Hans
> > > 
> > > 
> > > 
> > > 
> > > > > I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2 dock
> > > > > as my daily rider for testing purposes. When 5.6-rc1 came out I
> > > > > noticed that only 1 of the 2 1920x1080@60 monitors on the dock
> > > > > lights up.
> > > > > 
> > > > > There are no kernel errors in the logs, but mutter/gnome-shell says:
> > > > > 
> > > > > gnome-shell[1316]: Failed to post KMS update: Page flip of 93 failed
> > > > > 
> > > > > With 93 being the crtc-id of the crtc used for the monitor which is
> > > > > displaying black. Since then I've waited for 5.6-rc3 hoping that a
> > > > > fix was already queued up, but 5.6-rc3 still has this problem.
> > > > > 
> > > > > gnome-shell does behave as if all monitors are connected, so the
> > > > > monitor is seen, but we are failing to actually send any frames
> > > > > to it.
> > > > > 
> > > > > I've put a log collected with drm.debug=0x104 here:
> > > > > https://fedorapeople.org/~jwrdegoede/drm-debug.log
> > > > > 
> > > > > This message stands out as pointing to the likely cause of this
> > > > > problem:
> > > > > 
> > > > > [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master
> > > > > transcoder: <invalid>
> > > > > 
> > > > > Regards,
> > > > > 
> > > > > Hans
> > > > > 
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
