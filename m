Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B127C551B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 15:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD3510E1FE;
	Wed, 11 Oct 2023 13:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BD610E1FE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 13:18:31 +0000 (UTC)
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 473286607313;
 Wed, 11 Oct 2023 14:18:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697030309;
 bh=PAWJ3RzsuekP+W3e6be5gu5BDgIjN+40d2Z1bOG28aM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CPvcE8vDi5SergJ5DzBmpack84PQy7dQDKtxEd2SCcfL77jG4RrgQOdH1sygHooze
 vciWjN7skA2MOP3cAIZKTPh46lXKu288QpmuJ3TKB+YsufBrgGF4QeU70mzYOMqHRL
 Lt000mqJG+scMo3dNKbLNJcUTVQmijMAKIARXR0hmzudkHPaAHhoLMjVswHMiKIttu
 EsM6yUdDfQoBzi+hDz7mmW4zGmHugfAvvaOHPzQpTk16jeaWhKMvYnu8QrkolTaHx2
 UV1CWymdfAaHSnWsNSIYupvQUpAeQlGqeaqudirzDcKapgJgtqZe4z4qzSFkWnvVZQ
 sgJ3ciG5ImaAQ==
Date: Wed, 11 Oct 2023 09:18:23 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v10 07/16] drm/mediatek: aal: Use bitfield macros
Message-ID: <4fbfc898-b13c-4cf0-9a2a-308e37838dd8@notapiano>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804072850.89365-8-angelogioacchino.delregno@collabora.com>
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

On Fri, Aug 04, 2023 at 09:28:41AM +0200, AngeloGioacchino Del Regno wrote:
> Make the code more robust and improve readability by using bitfield
> macros instead of open coding bit operations.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
