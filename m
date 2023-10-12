Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C997C7691
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 21:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBB110E532;
	Thu, 12 Oct 2023 19:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC7A10E532
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 19:17:53 +0000 (UTC)
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 57FB56607358;
 Thu, 12 Oct 2023 20:17:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697138272;
 bh=XOvQRewMR/StJ5ta/O6p+3WXsHfd+0zrsVXkYfFjTcM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UkH0ypqERYp2FTBmpVNn7AWMLkLVVqgPpwlTm/3eoByGZzH137ghgNGk/8md/dc73
 0Ks8BauDyDFw9eUkEDBetdowuFH8BD9ALURwE5EPwXSFKlI83oXESWupYxy9WiPggj
 zV784MHq1fhA70jD5E+V9N2flsAy96lg8zJPCnRi4/gvVGLlHr7MPnyYEekRMaHM0v
 9wU7A5u6HkuvsDFmIbeOZ3B4FUx+P8oXwthgGwSNP1P0gko/9sFetdg6Gg+8OalEfm
 WEcSIltPu6TnaPf3n8O3vlWqjah+6/PBKuWaKM4Wzvp+EU1T+KLT0kYubM05mwTOnB
 LlGP9eOqME/Bg==
Date: Thu, 12 Oct 2023 15:17:46 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 08/16] drm/mediatek: De-commonize disp_aal/disp_gamma
 gamma_set functions
Message-ID: <1638da95-fd9c-4557-91d9-92bf1b54feaf@notapiano>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
 <20231012095736.100784-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012095736.100784-9-angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 11:57:28AM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding a 12-bits gamma support for the DISP_GAMMA
> IP, remove the mtk_gamma_set_common() function and move the relevant
> bits in mtk_gamma_set() for DISP_GAMMA and mtk_aal_gamma_set() for
> DISP_AAL: since the latter has no more support for gamma manipulation
> (being moved to a different IP) in newer revisions, those functions
> are about to diverge and it makes no sense to keep a common one (with
> all the complications of passing common data and making exclusions
> for device driver data) for just a few bits.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
