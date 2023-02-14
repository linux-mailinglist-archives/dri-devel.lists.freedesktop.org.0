Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30A6696FCE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 22:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232AB10E9C1;
	Tue, 14 Feb 2023 21:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5227F10E9A9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676410513; x=1707946513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VPGTDJyhjIdDevAm/7izz9E6Kei7p3VCLOPhAdXLQng=;
 b=YTdPoob10rqijDPOkBWd2tjsyty/jWfwzEMvyDlLzINvfkW2W2cpMXdK
 diZEiRkaT6wJyQX0EpLwHwOS/jpo4bqY48tZgWWNkhI7TXq2gXMyTMO3G
 dzIbY7nk0XsQ5zuR3Dp9273IhMScdJxlkdcuB4FZQ4p4u8F9T5GTprUeC
 bIweFBmmC3MipjYG/mM3X1P0uccHzG0FNJ/VWA/nwCy4bWEL/OlzJcEKh
 0kZ6TthsU+x/+ph54i54RFZOYKTfPMGPz5EV/eBwiiUh741B+GgjCi3g7
 hXnDXmQKheF2pKMlPaV+Bt/nxwXxR68AJw/TNLhQipW95O7s9MoHkQqBm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393679208"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="393679208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 13:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701779514"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="701779514"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2023 13:35:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Feb 2023 23:35:08 +0200
Date: Tue, 14 Feb 2023 23:35:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 RFC] video/hdmi: Fix HDMI_VENDOR_INFOFRAME_SIZE
Message-ID: <Y+v+jFKiQ3Rj2aYL@intel.com>
References: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
 <Y+DPQjukgC0BELkN@intel.com>
 <CAFBinCBpbRu9xfCEfZJfT7t3doV=+CX03+h7W+HsoW5T4X0W0w@mail.gmail.com>
 <Y+oa6O6+s5UXvOP6@intel.com>
 <CAFBinCC6RRiN0=XYNw464omzjHrRcNZn39i3_Ztfq6M2xMpgRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCC6RRiN0=XYNw464omzjHrRcNZn39i3_Ztfq6M2xMpgRw@mail.gmail.com>
X-Patchwork-Hint: comment
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernard Zhao <bernard@vivo.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hans.verkuil@cisco.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 10:26:24PM +0100, Martin Blumenstingl wrote:
> On Mon, Feb 13, 2023 at 12:11 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> [...]
> > > One could use HDMI_VENDOR_INFOFRAME_SIZE with this as well:
> > >   u8 buffer[HDMI_INFOFRAME_SIZE(VENDOR)];
> > > But it would only result in an 8 byte wide buffer.
> > > Nobody uses it like this yet.
> >
> > Not sure that would make any sense since a vendor
> > specific infoframe has no defined size until you
> > figure out which vendor defined it (via the OUI).
> My understanding is that all of the existing HDMI vendor infoframe
> code is built for HDMI_IEEE_OUI.

Only because no one has bothered to implement any
others.

> 
> > I suppose the current value of 4 is also a bit nonsense
> > as well then, becasue that is a legal value for the
> > HDMI 1.4 vendor specific infoframe, but might not be
> > valid for any other infoframe.
> >
> > We should perhaps just get rid of HDMI_VENDOR_INFOFRAME_SIZE
> > entirely.
> My thought was to make it the correct size for
> drm_hdmi_vendor_infoframe_from_display_mode(). Then developers using
> this "common" vendor infoframe don't have to worry much.
> If there's another vendor infoframe implementation (which I'm not
> aware of, but it may exist - since as you point out: it's vendor
> specific) then the driver code shouldn't use
> drm_hdmi_vendor_infoframe_from_display_mode() but rather implement
> something custom. At that point the person implementing that will also
> need to know their specific infoframe maximum size.

Yes but that other infoframe will still have
type==HDMI_INFOFRAME_TYPE_VENDOR, and
HDMI_INFOFRAME_SIZE(VENDOR) would again
give the wrong answer.

-- 
Ville Syrjälä
Intel
