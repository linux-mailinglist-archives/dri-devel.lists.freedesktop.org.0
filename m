Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4028CDC1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 14:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47556E8D6;
	Tue, 13 Oct 2020 12:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736F86E8D5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 12:03:41 +0000 (UTC)
Date: Tue, 13 Oct 2020 12:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1602590619;
 bh=xJSyQzG/wc/eo2ONFO3MxyEkoIOfZSkrghLMbcUyQAg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dW0FUHzmf4SQsmiETrMSH4Av2aeAGeg0ShH+Bd4aGcc4Xwt69ocpvsOcKx7BWpczu
 i+o71u7MBa8iuJDnoAVyBXAmJ6raRLt2jM8fqucX41jDc6gJhbuIyXmI0LaVWavZO2
 SKtLFZWQ3vrpd2y9D9sFK3IqA3pVBieLXXv62uP5osjeGokhrnqC1FiBLG0BCIdu20
 DvIjoHZz2uT88BBZXWaxOk1R4P9+TjcSdYaTIf7094vNJ4t6GXL3v8NZSLD0g3HvCy
 LncPhPvtx2GDCkwIGeUPSdznJcRz/vfqckgukjnK8yo4meFtEzXCL3TuHEJKEBMVs0
 Kikz7jSugC8pA==
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 1/5] drm: Introduce plane and CRTC scaling filter
 properties
Message-ID: <5OoxGqCN-WPshwwU1WctxYhcJ3OqwLmph6wWhq-ZgTfKPhz1WQLGJlZZN1p2oM082DxSn0cv-nUP9bLJcdtoaK8FLvaXxoa5TB2N0LEy3LI=@emersion.fr>
In-Reply-To: <20201012184130.937-2-pankaj.laxminarayan.bharadiya@intel.com>
References: <20201012184130.937-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20201012184130.937-2-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "sameer.lattannavar@intel.com" <sameer.lattannavar@intel.com>,
 "daniels@collabora.com" <daniels@collabora.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lorusak@gmail.com" <lorusak@gmail.com>,
 "themagnificentmrg@gmail.com" <themagnificentmrg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +/**
> + * DOC: Plane scaling filter property
> + *
> + * SCALING_FILTER:
> + *
> + *	Indicates scaling filter to be used for plane scaler
> + *
> + *	The value of this property can be one of the following:
> + *	Default:
> + *		Driver's default scaling filter
> + *	Nearest Neighbor:
> + *		Nearest Neighbor scaling filter
> + *
> + * Drivers can set up this property for a plane by calling
> + * drm_plane_create_scaling_filter_property
> + */

Similarily, this can be moved in "Plane Composition Properties".

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
