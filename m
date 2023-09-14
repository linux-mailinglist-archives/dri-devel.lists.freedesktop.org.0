Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB857A4213
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6F510E1EA;
	Mon, 18 Sep 2023 07:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-226.mta0.migadu.com (out-226.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::e2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8733510E4FD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 04:16:11 +0000 (UTC)
Date: Thu, 14 Sep 2023 14:12:00 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694664969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KgCBja6vR6ucPDDS+ICdvobr8KN6Wt6fcPO6ka4rjrI=;
 b=FXxIkFkR/iQ/43B4BkObLiuYQ0cH2IRjIphI9PU/lB+GL/5f8S5co1GA+IdsKS3tNCYemt
 gnnvY/GwpeKQj4wcrGMJNVDTxpU9O/J/69ykG7yY3yD+5pQ+NKgkLcK5Sbjf6v3Wgld2+j
 97qr9tcsI/fiqwXBpoVtENXdJxJXDRt+3MKEADb0r1gXoHAC57hlAaErNTG/8+vqiyxsBQ
 yQJyv/wa+Q4xU1tbdlWXUfLmK4U4o+mZBPzolDqQuqEpFyI5WLbSjgjZHdYa9XTRI8HMsa
 FlCsemuEtjs1fZUBph80jPqa2Hmj0Q0e6DSXLXa+k7sYiMS++qZslT54G2sTFQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH 1/8] drm/panel: nv3052c: Document known register names
Message-ID: <ZQKIED7jCc1FuPP1@titan>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-2-contact@jookia.org>
 <977a8de9-26ec-1789-4c72-fd36f34480c3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <977a8de9-26ec-1789-4c72-fd36f34480c3@quicinc.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 13, 2023 at 02:43:43PM -0700, Jessica Zhang wrote:
> Hi John,
> 
> Just curious, what do you mean by these registers being mostly unknown?
> 
> I do see them specified in the online specs -- some even seem to map to
> existing MIPI_DCS_* enums (ex. 0x01 to MIPI_DCS_SOFT_RESET, and 0x04 to
> MIPI_DCS_GET_DISPLAY_ID).
> 
> Thanks,
> 
> Jessica Zhang

Hi Jessica,

Unfortunately these registers are not MIPI ones, but on a separate page of
registers. So page 2 register 1 isn't MIPI_DCS_SOFT_RESET, that is page 0
register 1.

John.
