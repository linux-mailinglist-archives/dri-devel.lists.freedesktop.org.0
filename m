Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C323CE00
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 20:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763A06E82B;
	Wed,  5 Aug 2020 18:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A34A6E82B;
 Wed,  5 Aug 2020 18:05:00 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3CE7C8053F;
 Wed,  5 Aug 2020 20:04:55 +0200 (CEST)
Date: Wed, 5 Aug 2020 20:04:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v4] drm/kmb: Add support for KeemBay Display
Message-ID: <20200805180454.GA794025@ravnborg.org>
References: <1596141884-29868-1-git-send-email-anitha.chrisanthus@intel.com>
 <1596141884-29868-2-git-send-email-anitha.chrisanthus@intel.com>
 <20200802152342.GA1764350@ravnborg.org>
 <BY5PR11MB4182B032DC268C4156B4EEE58C4D0@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB4182B032DC268C4156B4EEE58C4D0@BY5PR11MB4182.namprd11.prod.outlook.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=fxJcL_dCAAAA:8 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8
 a=L49k5ZVyAAAA:20 a=nrtz98gpnIkr82PetmUA:9 a=CjuIK1q_8ugA:10
 a=SEwjQc04WA-l_NiBhQ7s:22 a=P4VdviVPEcjfz_PVVggX:22
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha.

On Mon, Aug 03, 2020 at 09:02:24PM +0000, Chrisanthus, Anitha wrote:
> Hi Sam,
> I installed codespell, but the dictionary.txt in usr/share/codespell/dictionary.txt
> seems to be different from yours. Mine is version 1.8. Where can I get the dictionary.txt
> that you are using?
I dunno.

$ apt info codespell
Package: codespell
Version: 1.16.0-2
Priority: optional
Section: universe/devel
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian Python Modules Team <python-modules-team@lists.alioth.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 572 kB
Depends: python3, python3-chardet, python3:any
Homepage: https://github.com/codespell-project/codespell/
Download-Size: 118 kB
APT-Manual-Installed: yes
APT-Sources: http://dk.archive.ubuntu.com/ubuntu focal/universe amd64 Packages
Description: Find and fix common misspellings in text files
 codespell is designed to find and fix common misspellings in text files.
 It is designed primarily for checking misspelled words in source code,
 but it can be used with other files as well.

> I have corrected the relevant spelling warnings from your email and have sent v5.

The spelling mistakes was the least relevant warnings.
Please see examples in the following.

> > -:146: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open
> > parenthesis
> > #146: FILE: drivers/gpu/drm/kmb/kmb_crtc.c:58:
> > +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > +			LCD_INT_VERT_COMP);
Here we want LCD_INT_VERT_COMP to be aligned right after the opening
'('. It must be indented with a number of tabs followed by the necessary
spaces to achive this indent. Always uses tabs for indent if possible.
So in other words 8 spaces are not OK, then use a tab.

Same goes for similar warnings.
> > -:427: CHECK:LINE_SPACING: Please don't use multiple blank lines
> > #427: FILE: drivers/gpu/drm/kmb/kmb_drv.c:74:
> > +
> > +
> > 
Do not use two consecutive blank lines.

> > -:463: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
> > #463: FILE: drivers/gpu/drm/kmb/kmb_drv.c:110:
> > +	kmb->sys_clk_mhz = clk_get_rate(kmb_clk.clk_pll0)/1000000;
> >  	                                                 ^

Spaces around all operatoers - so space before and after '/' here.
Same goes for following warnings of the same type.

> > -:688: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
> > #688: FILE: drivers/gpu/drm/kmb/kmb_drv.c:335:
> > +	if (status & LCD_INT_EOF) {
> > +
As the warning says - no empty line after opening '{'

> > 
> > -:701: CHECK:CAMELCASE: Avoid CamelCase: <LCD_LAYERn_DMA_CFG>
> > #701: FILE: drivers/gpu/drm/kmb/kmb_drv.c:348:
> > +						    LCD_LAYERn_DMA_CFG
> > 
If you have a reason to use CamelCase then this can be ignored.
A good reason could be that this is how it is done in the datasheet.
In this case maybe use LCD_LAYER_N_DMA_CFG or similar.

> > -:957: CHECK:BRACES: braces {} should be used on all arms of this statement
> > #957: FILE: drivers/gpu/drm/kmb/kmb_drv.c:604:
> > +	if (adv_bridge == ERR_PTR(-EPROBE_DEFER))
> > [...]
> > +	else if (IS_ERR(adv_bridge)) {
> > [...]
If we use {} in one arm of the statement use it in all arms.
This, as the other tidbits, improve readability.

Same for all similar warnings.

> > -:1026: WARNING:UNDOCUMENTED_DT_STRING: DT compatible string
> > "intel,kmb_display" appears un-documented -- check
> > ./Documentation/devicetree/bindings/
> > #1026: FILE: drivers/gpu/drm/kmb/kmb_drv.c:673:
> > +	{.compatible = "intel,kmb_display"},

Binding is missing - we cannot apply a driver for an unknown binding.
The binding must be in DT-schema (yaml) format.

> > 
> > -:1122: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without
> > comment
> > #1122: FILE: drivers/gpu/drm/kmb/kmb_drv.h:35:
> > +	spinlock_t			irq_lock;

Add comment.
And consider a more specific name like kmb_irq_lock - allows for easier
grepping.

> > 
> > -:1360: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
> > #1360: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:95:
> > +	uint16_t default_bit_rate_mbps;
As the warning says. This goes again later.

> > -:1947: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written
> > "fg_cfg->sections[i]"
> > #1947: FILE: drivers/gpu/drm/kmb/kmb_dsi.c:682:
> > +		if (fg_cfg->sections[i] != NULL)

Hmm, I like the current code. But better please checkpatch here.

I did not go through them all.
The point is that all the warnings from checkpatch should be considered,
and for the most of them they are legit and should be fixed.

	Sam

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
