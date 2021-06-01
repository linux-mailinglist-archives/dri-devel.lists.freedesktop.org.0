Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7D4397C81
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 00:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD026E0F3;
	Tue,  1 Jun 2021 22:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679786E0F3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 22:43:15 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m18so252492wrv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 15:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=raFJDnqbgQffbni8cDqTXKBGaMGmBnwdhZuZ4furOas=;
 b=PBML801JMX/hN5wMJZpa3YXKvlTCQdjD/hVejz4WNXph7LUicuZjJEy68H56jOSB6b
 FEORY55Jw6QaN4DIB1OgKLOZ6M3TU6OGOd5xsn0G8jEOuPPWUvJRC9l8iyKT+798gcPI
 xu+ECeyenJOyW4+xSzUNehG1ZtTKgCrevFXH69gF/3lQQ+qPhjHqQ8iiOkrcj3/Gpe0V
 Bi4MopTXhRW/who5oddgLI1tevkw2QtR8qfbRoS+ueMT71jUwPzEIbw/So3uGq5nvHUW
 TPf09w7dURkvq1i+LnlH46yENmoDgL4nL3YmjO3+5/Bd/oimB9fR2r01lyDMrxy+PkIs
 BLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=raFJDnqbgQffbni8cDqTXKBGaMGmBnwdhZuZ4furOas=;
 b=Ah1sNUoyqzKbPLnE2JPMcwPTtk71pNG97OOIPZtsPEGzxmcQz9TaPm+5GKMjPojfIr
 GTcWdruOeUC59ofFatp6BkQSPnwldupJ3d+daNFZ1O/XK5VPZIf6Tw7y5wn0AqK6EBpT
 /RvlZ5vHbtSFaQjAbC2PO/Bkh1Rr1dkiNj5T/3/dH2aIiZK1j0gGTKNA7HZ8YHvCu8JP
 j05pUxBltcwybhjAk1oHTf2d+u0J052v62jETsKk2+rWTwJ0/X9zNFfVMMe12uOrgTOo
 C9fmUETefM7Dzh0aJG+oQAvjf+h6y3/YD1LbAUCb9m6r+ILpV7ZnAuBLsu1kLc6OU6l6
 Arzw==
X-Gm-Message-State: AOAM531MIZeDM4Sy3fU8P7O+Nv/EP6CsMfDwyx95SM/0uVwlHXuVJWNa
 GjbykarAchRRsBydZYuN7ohltg==
X-Google-Smtp-Source: ABdhPJwodA6g8jsn7Q1onsK/KORLTKnjf6z4nY0MCi5ZViExSRl1KOCI/JeY1jD+fz1f5FRqVen0NQ==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr25045058wrr.106.1622587394303; 
 Tue, 01 Jun 2021 15:43:14 -0700 (PDT)
Received: from bilrost ([2a01:e0a:806:8950:dea6:32ff:fe0d:99f9])
 by smtp.gmail.com with ESMTPSA id n13sm5109915wrg.75.2021.06.01.15.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 15:43:13 -0700 (PDT)
Date: Wed, 2 Jun 2021 00:43:11 +0200
From: Anisse Astier <anisse@astier.eu>
To: Ville Syrj?l? <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915/opregion: add support for mailbox #5 EDID
Message-ID: <YLa22EBqxE2sBdpp@bilrost>
References: <20210531204642.4907-1-anisse@astier.eu>
 <20210531204642.4907-2-anisse@astier.eu>
 <YLZXQLh2Qmxs+CWU@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLZXQLh2Qmxs+CWU@intel.com>
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
Cc: Daniel Dadap <ddadap@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le Tue, Jun 01, 2021 at 06:50:24PM +0300, Ville Syrj?l? a ?crit :
> On Mon, May 31, 2021 at 10:46:41PM +0200, Anisse Astier wrote:
> > The ACPI OpRegion Mailbox #5 ASLE extension may contain an EDID to be
> > used for the embedded display. Add support for using it via by adding
> > the EDID to the list of available modes on the connector, and use it for
> > eDP when available.
> > 
> > If a panel's EDID is broken, there may be an override EDID set in the
> > ACPI OpRegion mailbox #5. Use it if available.
> 
> Looks like Windows uses the ACPI _DDC method instead. We should probably
> do the same, just in case some crazy machine stores the EDID somewhere
> else.

Thanks, I wouldn't have thought of this. It seems Daniel Dadap did a
patch series to do just that, in a generic way:
https://lore.kernel.org/amd-gfx/20200727205357.27839-1-ddadap@nvidia.com/

I've tried patch 1 & 2, and after a fix[1] was able to call the _DDC method
on most devices, but without any EDID being returned.

I looked at the disassembled ACPI tables[2], and could not find any
device with the _DDC method. Are you sure it's the only method the
Windows driver uses to get the EDID ?

Regards,

Anisse

[1] _DOD ids should only use 16 lower bits, see table here:
https://uefi.org/specs/ACPI/6.4/Apx_B_Video_Extensions/display-specific-methods.html#dod-enumerate-all-devices-attached-to-the-display-adapter
[2] acpidump: https://gitlab.freedesktop.org/drm/intel/-/issues/3454#note_913970

