Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D52F6943FA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46AB10E54B;
	Mon, 13 Feb 2023 11:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2862B10E555
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676286701; x=1707822701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5V7ibw1r5Bmu9z9b7YvauYuBzcaPkTNEeovkdnv9j0E=;
 b=RjlTZnAkudJed8xc24OlW4qPksv1bU1LWCalF5/YJBb/fyxVqPisiSCd
 dE9vfu1LtjlYFZWbpfepF82a0qEiDDEktcpemMPeSJCFlRcvbn7s2gx2y
 lQoRckrrHHBU0UnysIEp++Y/jYq1MILlNA0V2ssnn3gIE6irigavMyUQN
 ylAWBQkLoaoB+2lvYZsQFBsJVK0L/E2qNlw2q6FQauIZgmg236BzNpE03
 Lu5c0j4XagFAqev3pIo0mIX1EUIupxR/80dBZrvyz352XG7F9RnQ6ovQE
 IDouq83W2bUHpfmit5xN7Q49ZYT+4g7bHra5F4HHBBmpefoFu03OpcOyc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="311228734"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="311228734"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 03:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670785834"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670785834"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga007.fm.intel.com with SMTP; 13 Feb 2023 03:11:37 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Feb 2023 13:11:36 +0200
Date: Mon, 13 Feb 2023 13:11:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 RFC] video/hdmi: Fix HDMI_VENDOR_INFOFRAME_SIZE
Message-ID: <Y+oa6O6+s5UXvOP6@intel.com>
References: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
 <Y+DPQjukgC0BELkN@intel.com>
 <CAFBinCBpbRu9xfCEfZJfT7t3doV=+CX03+h7W+HsoW5T4X0W0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCBpbRu9xfCEfZJfT7t3doV=+CX03+h7W+HsoW5T4X0W0w@mail.gmail.com>
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

On Sat, Feb 11, 2023 at 09:43:50PM +0100, Martin Blumenstingl wrote:
> Hello Ville.
> 
> On Mon, Feb 6, 2023 at 10:58 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> [...]
> > > Change HDMI_VENDOR_INFOFRAME_SIZE to 6 bytes so
> > > hdmi_vendor_infoframe_pack_only() can properly check the passed buffer
> > > size and avoid an out of bounds write to ptr[8] or ptr[9].
> >
> > The function should return -ENOSPC if the caller didn't
> > provide a big enough buffer.
> Indeed, I'm not sure why I didn't notice when I sent the patch.
> 
> > Are you saying there are drivers that are passing a bogus size here?
> Thankfully not - at least when I checked the last time drivers passed
> a 10 byte - or bigger - buffer.
> My main concern is the HDMI_INFOFRAME_SIZE macro. It's used in various
> drivers like this:
>   u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
> 
> One could use HDMI_VENDOR_INFOFRAME_SIZE with this as well:
>   u8 buffer[HDMI_INFOFRAME_SIZE(VENDOR)];
> But it would only result in an 8 byte wide buffer.
> Nobody uses it like this yet.

Not sure that would make any sense since a vendor
specific infoframe has no defined size until you
figure out which vendor defined it (via the OUI).

I suppose the current value of 4 is also a bit nonsense
as well then, becasue that is a legal value for the
HDMI 1.4 vendor specific infoframe, but might not be
valid for any other infoframe.

We should perhaps just get rid of HDMI_VENDOR_INFOFRAME_SIZE
entirely.

> 
> Do you see any reason why my patch could cause problems?
> If not then I want to re-send it with an updated description.
> 
> 
> Best regards,
> Martin

-- 
Ville Syrjälä
Intel
