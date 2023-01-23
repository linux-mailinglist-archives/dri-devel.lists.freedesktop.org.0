Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116FE678071
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C3B10E4E3;
	Mon, 23 Jan 2023 15:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB0610E4E2;
 Mon, 23 Jan 2023 15:49:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C200D2D9;
 Mon, 23 Jan 2023 16:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674488980;
 bh=zsDmmFaVw8eWcq27RJRLSVyDCigJwIYalpynKAmVx94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oTpO2xtuCgkoq907YiKL2WbJJJ38PBJ6aZaBA5LPBMhi8rHPWWKgklKkBNeHQlWSj
 GI7weGO+qvKO4AI7KRNKsaJ46yC6a3/OgRCevQo2TYgTMMwNwaXx6KiXiLkEE8AEPc
 rUrygzpIjNfMj+ShD5zCskbxstDtBSGkFKblMWFE=
Date: Mon, 23 Jan 2023 17:49:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [ANNOUNCE] pixfmtdb
Message-ID: <Y86skCbxY5kZglo8@pendragon.ideasonboard.com>
References: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
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
Cc: linux-media@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC'ing the linux-media mailing list.

On Mon, Jan 23, 2023 at 02:10:58PM +0000, Simon Ser wrote:
> Hi all,
> 
> In the last few days I've been working on a small new project, pixfmtdb [1].
> It's a Web database of pixel format guides, it can be useful to understand
> how pixels are laid out in memory for a given format and which formats from
> various APIs are compatible with each other.
> 
> pixfmtdb relies on the Khronos Data Format Specification [2] to describe
> each format. This means that each format is described with a standardized
> data blob, which can be re-used with other tools for other purposes.
> 
> My future plans include adding more formats and format families to pixfmtdb,
> and make it easy to use the data for code generation, in particular for
> automatically generating tables containing metadata about formats, as used
> in Wayland compositors and other projects.
> 
> I hope some of you can find this work useful,
> 
> Simon
> 
> [1]: https://pixfmtdb.emersion.fr
> [2]: https://www.khronos.org/dataformat

-- 
Regards,

Laurent Pinchart
