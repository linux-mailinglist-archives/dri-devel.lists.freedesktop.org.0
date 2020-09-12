Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6099267C3A
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 22:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A556E03E;
	Sat, 12 Sep 2020 20:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CF56E03E
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 20:20:23 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A5DE320020;
 Sat, 12 Sep 2020 22:20:19 +0200 (CEST)
Date: Sat, 12 Sep 2020 22:20:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Message-ID: <20200912202018.GA1129610@ravnborg.org>
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
 <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
 <a1e50102-f400-c45c-9111-5b8afdba614c@baylibre.com>
 <BY5PR11MB418272DBF475568D4CE2B0D38C240@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB418272DBF475568D4CE2B0D38C240@BY5PR11MB4182.namprd11.prod.outlook.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=9AdMxfjQAAAA:20 a=ZIUaFP9zINnSN39H1iAA:9
 a=CjuIK1q_8ugA:10 a=VlZU0XKO32wA:10 a=443qOekVpzXbzkAZ2tlV:22
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha.

On Fri, Sep 11, 2020 at 08:54:41PM +0000, Chrisanthus, Anitha wrote:
> Hi Neil,
> Thanks for your review. Is a device tree binding document like this one enough? Entries for kmb-drm are similar to this.
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/gpu/brcm%2Cbcm-v3d.txt
> 
> How do I submit it once I have it ready?
Please take a look at:
Documentation/devicetree/binding/submitting-patches.rst

That should explain it all.

New bindings must be in DT Schema foramt (.yaml files).
You can be assured that if you fail to do a dt_binding_check there are
syntax erros - speaking of experience.
So you need to get the tooling up and running.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
