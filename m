Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCC8AA7676
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 17:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E067D10E1CB;
	Fri,  2 May 2025 15:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C2810E1CB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=77t87rE0+Ie/XOv1QrJlACmGkOIthRco+3O3xhyV8iE=; b=JsZFhV8j/YfgQJyEiHmt/UjETm
 13jmvuyG8AFsMfsbqorL7m3wpda5+otymSvyk+p0Frq6+IOGPJcDaUDvXJBSzmyNi7694XRNBYPR9
 CtkZC1/TDTabiqNT55T/gWUYsB3wBv+Bmo4J2x86zgfHeMZSaxJO6XtS8Rd/3d+34+aK2Uv6wb3q1
 piSXZx5MX3E3KXZ/0ewXMLSUPoLtdcNZuClTItm0j4oDStiJ3q20JRKRfn3trVSGKtxfpJd/CGio7
 xJdJ9eghN1MVeI+PK1ep19Ka2tC16w5c7oKCy7B8zRCAsONjxe3AdadzOARCykn9eCKL5qvpt0p6y
 um0hb+7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uAsdk-000000051JO-39jB;
 Fri, 02 May 2025 15:49:28 +0000
Date: Fri, 2 May 2025 16:49:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
Message-ID: <aBTpiMIevmAmp5vr@casper.infradead.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-10-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502100049.1746335-10-jens.wiklander@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 02, 2025 at 11:59:23AM +0200, Jens Wiklander wrote:
> Export the two functions cma_alloc() and cma_release().

Why?  This is clearly part of a larger series, but you've given those of
us who are subscribed to linux-mm absolutely no information about why
you want to do this.
