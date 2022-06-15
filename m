Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FC054D1E1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 21:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBE9112825;
	Wed, 15 Jun 2022 19:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8514F112825
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 19:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=15FyG0ZoxrIlS9d/qUWoq8nPBuP6Rk8SkSTpazIFOGc=;
 b=Qw+iLmhW9u/qhC+ACSzA9aBR2DEjsJkTmwjHF2vtIf8iDNL8XXHzm5ScKrjTEynjWVQGhEouBDvtx
 dnCb5t2iXrTgkKQ3KXirU4QhVq+mQvGKfewTWehFwlpK1wf51LJLDHJJgrCnljDHW0GkSwxh5H/I2Q
 8OTycs1QmN8GJGIim0Wvepp/iqAupOKSVJ2sA+Itnkj7jQC1Hxa0PM+ZK3YepFtFhDszyDhIcXRpOb
 NURMqqvnPGB73UFjgNva50GfmtchX2+HflroYf46o/C4DAiCPz0bph9DgGJffbSDHGPWF17MVq/ESU
 +qpvdqSLekUtRNGfcBfwh8wMZPdjnGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=15FyG0ZoxrIlS9d/qUWoq8nPBuP6Rk8SkSTpazIFOGc=;
 b=1vsxGfQJevWdvpfQ+D2T+gAh2Bhws8+LWvo7OnIs55L+Ds4+4RDkdQSIK/RSJwnLUiZkDLBp+BXZO
 NezqcsRCw==
X-HalOne-Cookie: 37a893b9610b0b5019e39e21c5719d044b562344
X-HalOne-ID: adc998a9-ece3-11ec-a6c1-d0431ea8a283
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id adc998a9-ece3-11ec-a6c1-d0431ea8a283;
 Wed, 15 Jun 2022 19:45:16 +0000 (UTC)
Date: Wed, 15 Jun 2022 21:45:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/8] drm: Drop drm_blend.h from drm_crtc.h
Message-ID: <Yqo2yo+kpcBlAVc+@ravnborg.org>
References: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
 <20220613200317.11305-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220613200317.11305-4-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville.

On Mon, Jun 13, 2022 at 11:03:12PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm_crtc.h has no need for drm_blend.h, so don't include it.
> Avoids useless rebuilds of the entire universe when
> touching drm_blend.h.
s/drm_blend.h/drm_crtc.h/
> 
> Quite a few placs do currently depend on drm_blend.h without
> actually including it directly. All of those need to be fixed
> up.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
With the commit message fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
