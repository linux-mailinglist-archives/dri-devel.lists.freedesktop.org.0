Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1432C3BF16D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 23:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1176E0A6;
	Wed,  7 Jul 2021 21:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929206E0A6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 21:30:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d2so4783337wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 14:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ljQqoP6rxlK/tjwVEtpyYxX2VWlULGRYQkPl439WiQc=;
 b=p+B2KU7I51TAF6gyo89w/VdnEH8giFL45WvRzvUeR5b7MOK3JzBibwivPGKNfrezdr
 +bOSOuaKdk4phTlAaaFQfUO/Exzw0x6tyHqVkwpqkpDvqby+6xK28aaFoR4Cnx+9avsV
 lcN/9If4FJReWTQ0XwE/GTGbjH+T0L4Nm4qZMEZpL1PTJFjVA8xQ6lTdnqZG5weXlJz5
 hqaUIv4q2B6oHkQsyD8gs/bT71SAhMnLnneungcQeszzhx/wQ8eHx0hK7zPy+J90Ewb3
 vimsxHd+sw8P3xAja74YSluSl+pcJF7vKCkZJ21xHZ3Abs2Z/ik4anpooxWsJ9ugxs2/
 K3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ljQqoP6rxlK/tjwVEtpyYxX2VWlULGRYQkPl439WiQc=;
 b=KzU2dc+eW2LgnCfmf1b/FHxQUUcb9tk+izRnzOMTUotE7Aw51DH82HHtBqp+NgsRjZ
 5K8KBmohb3oCcjmUqeCHCzwFpA0PUp44Ewwa3/anAGBS2AF0vSE23r9lXDrUrtSB8lw0
 l37SClBw9FEF3+kKopu94aihm2PrGFhRCQGQ1vPBsbFRQZaGK3Fu7uArJ8x0s1q7AQu+
 I1M/EuJVg35spsEVmjc8dEYePKFL60PZn+Pox+oxT5TpVxoB5VAKM7G5buoWrxtd65m0
 C7snLvyt1526YR7ydzA/Dhl4REg1qzAdGNV+Vst5bQag1afVWEmN+/P10STzebVsFxE6
 fl0Q==
X-Gm-Message-State: AOAM530ca71DWwpUp7Kd6R/QAB6NFtCFBkdWZVqiTypThoQGF6ntWlRC
 vEisY+HiAF9kHRjbUxs/gYwccg==
X-Google-Smtp-Source: ABdhPJzt3juhEz02edhUA7v03Cu/Qgu1bpqqXlgQ1anF1ldalf8ehYw0H4t5RJf3U12BCk5qtz7POg==
X-Received: by 2002:a5d:46c8:: with SMTP id g8mr5801200wrs.341.1625693440031; 
 Wed, 07 Jul 2021 14:30:40 -0700 (PDT)
Received: from bilrost ([2a01:e0a:806:8950:dea6:32ff:fe0d:99f9])
 by smtp.gmail.com with ESMTPSA id f13sm109060wrt.86.2021.07.07.14.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 14:30:39 -0700 (PDT)
Date: Wed, 7 Jul 2021 23:30:37 +0200
From: Anisse Astier <anisse@astier.eu>
To: Daniel Dadap <ddadap@nvidia.com>
Subject: Re: [PATCH v2 1/2] drm/i915/opregion: add support for mailbox #5 EDID
Message-ID: <YOYc/ak4UlIF0yIo@bilrost>
References: <20210531204642.4907-1-anisse@astier.eu>
 <20210531204642.4907-2-anisse@astier.eu>
 <YLZXQLh2Qmxs+CWU@intel.com> <YLa22EBqxE2sBdpp@bilrost>
 <43427294-b19b-f32e-3b75-479eac6628ca@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43427294-b19b-f32e-3b75-479eac6628ca@nvidia.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le Wed, Jul 07, 2021 at 02:57:47PM -0500, Daniel Dadap a écrit :
> On 6/1/21 5:43 PM, Anisse Astier wrote:
> > 
> > Le Tue, Jun 01, 2021 at 06:50:24PM +0300, Ville Syrj?l? a ?crit :
> > > On Mon, May 31, 2021 at 10:46:41PM +0200, Anisse Astier wrote:
> > > > The ACPI OpRegion Mailbox #5 ASLE extension may contain an EDID to be
> > > > used for the embedded display. Add support for using it via by adding
> > > > the EDID to the list of available modes on the connector, and use it for
> > > > eDP when available.
> > > > 
> > > > If a panel's EDID is broken, there may be an override EDID set in the
> > > > ACPI OpRegion mailbox #5. Use it if available.
> > > Looks like Windows uses the ACPI _DDC method instead. We should probably
> > > do the same, just in case some crazy machine stores the EDID somewhere
> > > else.
> > Thanks, I wouldn't have thought of this. It seems Daniel Dadap did a
> > patch series to do just that, in a generic way:
> > https://lore.kernel.org/amd-gfx/20200727205357.27839-1-ddadap@nvidia.com/
> > 
> > I've tried patch 1 & 2, and after a fix[1] was able to call the _DDC method
> > on most devices, but without any EDID being returned.
> > 
> > I looked at the disassembled ACPI tables[2], and could not find any
> > device with the _DDC method. Are you sure it's the only method the
> > Windows driver uses to get the EDID ?
> 
> 
> _DDC only works on devices that actually implement it, and the vast majority
> of devices don't, because the display just provides an EDID normally. AIUI,
> usually a device will implement _DDC either because an embedded panel has no
> ROM of its own to deliver an EDID, or to allow the EDID to be read by either
> GPU on a system with a muxed display, regardless of which GPU happens to
> have the DDC lines (in TMDS) or DP AUX routed to it at the moment. (To my
> knowledge, nobody actually muxes DP AUX independently from the main link,
> but there were some older pre-DP designs where DDC could be muxed
> independently.)
> 
> I'm not sure whether the comment about Windows using _DDC was meant for this
> device in particular, or just more generally, since DDC is part of the ACPI
> spec and some Windows GPU drivers *do* use it, where available. If it was
> meant for a particular device, then it's possible that the ACPI tables
> advertise different methods depending on e.g. _OSI. If you haven't already
> tried doing so, it might be worth overriding _OSI to spoof Windows, to see
> if _DDC gets advertised.

I think it's already the default Linux behaviour according to
https://www.kernel.org/doc/html/latest/firmware-guide/acpi/osi.html

I added a few specific Windows versions (2007 - 2020), but did not see
any difference.


> 
> I'm not sure how you were able to call _DDC without an EDID being returned
> as described above, if there was no _DDC method in the ACPI tables; I would
> expect that attempting to call _DDC would fail to locate a suitable method
> and do_acpi_ddc would return NULL.

I wasn't, I just tried calling the method on all devices (removing the
_DOD id check), but obviously it failed because it did not exist.

> 
> 
> > Regards,
> > 
> > Anisse
> > 
> > [1] _DOD ids should only use 16 lower bits, see table here:
> > https://uefi.org/specs/ACPI/6.4/Apx_B_Video_Extensions/display-specific-methods.html#dod-enumerate-all-devices-attached-to-the-display-adapter
> 
> 
> Thanks; I don't see a version of your modified patch here, was the fix just
> to mask the _DOD IDs against 0xffff?

Yes, nothing fancy:

-                       if (adr == dod_entries[i]) {
+                       if (adr == (dod_entries[i] & 0xFFFF) ) {


Regards,

Anisse
