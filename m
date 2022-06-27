Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156F55B953
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 13:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAB4113382;
	Mon, 27 Jun 2022 11:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524BA113444
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656327779;
 bh=0ha3Qc5KZYDBb1KelKRriSZCCtYB9uIg1cWmbtEov6o=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=kmODS1LyKuos+bu4gBGLeOhMdifJ8OhwSrlO/VGWA8q6vrSD48TDdjZ20lo1KdEnL
 QtyHqEiM73gQDVqmLoP86Xms5ZSZkFo8i45a2PENWy7hiDleaDKKj5jOmDjMSvZMot
 ogHlGYg52d2xW32ModYbBN/aHxF+mrUID+IrM68M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.176.39]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZCfD-1oA1kx3T4T-00VBWr; Mon, 27
 Jun 2022 13:02:58 +0200
Message-ID: <7023507c-d9f9-6e70-b2bf-c3995a516649@gmx.de>
Date: Mon, 27 Jun 2022 13:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/4] fbcon: Fixes for screen resolution changes
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
References: <20220626102853.124108-1-deller@gmx.de>
In-Reply-To: <20220626102853.124108-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XdnZ6Q294OZHs53Rio0ZelGeKKvGPa0znhC43duZ9RaiwiasppT
 LWVY6Ai7626NgElvrfbooJJRePb9uv2yML3lZxWVTXveO0qWUXwahnJnfoBTzAxyous0YfF
 MISZgU8hWjO80JTop6OS5DDZK1sLOr60OjoHklOZ6MsK0Ao9JyCPncr/rk5FROT1DxeP16Y
 2CA7QfEn4/qT27IB8auQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9YOCWXmXI2Q=:MbFYpDVwP5E3j//7wBUogR
 TQXiLoGunCaq4p9wAKN3bOd6TD55FkmWDvAAfaOsuUbU8JQa4ypNft2XVUiM/l1a+uq+azZwP
 vvbAEnTpUc1KCo8EwN1cO8UKTh6edZFHxVg6DJjGbeUtVfhVWDzyYsKEJF3bFGulPyUc84k1U
 EG6gW8QyAQswWhMaZ77FVuepTxzb7ZQOUmtCjoqqlmz/82HukfXN62P6URqIq5K5HP//tKvey
 ekj/KZXtQ+Vg2yCfEiCDZoIGapXES0PKaDaW1jNahRcBiM+RNbyn1TQDXDionC/SESdmDSebS
 AYte4wFwdxtGx3QHI8FMpi13an6DxaQpnncbr4CfFwBUqB3xQLenOKb2uV9EPIumIXBJsQ5Wc
 x5avOgVPnlKdwceC2nT4M2Rx5GhfWLkS7Ju+mvwngEbhnpSDftS9W+BkHluNHCWwzdR+/LdH5
 o8c1TBsa26NF9G4npKNX1f1NPN4Xc0XMaXKz3hr97ecE7pvDVQzgDfX8+9dWsH+4+5qX/W9Q1
 sEYy3i4h3fm/dVZXwg3DS8JX98T3ecNXDJj7kZUd8tFC1h752VYrTLQ/tHa9ntFdnj9TWyJA/
 drdPJKKY4nspuUJKphcWWGTYif4bLmuFO5ygqrIpPFF8zhSBSeYxaS5PxiXeaST9IwxDHIyeN
 OLnYeGvCWUZteOTeEVS70+Upk7tGWS/PQmDHlHC9svrfDUt86ifoDOIPAbZqeGUyki4v4+upr
 EzQc7Fi5q90xXuSZV3X8x0BhNZEruy0LxagTZzVYL38BqXyGk0HXFefITuH5Lusi6/8d1U6X9
 vigHMrK+JQ3Md2sJXPxz/Rz3om9aEARm3it/tFTTRSE5CH6bghYtZny4yLhYQB2FyklCZ5q81
 7BWD/IMFAuetqW7Co450FFpWB6vKfdBEP5CSAj7Zu0tdAKmQPxN4Zr37Mu0dTmiodAr7eEbmS
 jTx7ES/PvYUW4rMWUY+Uzf6PBgLiRekcvBGQomfVo8Xy6nVMNXIopPHBdMDFq4ug4BfTLh0W6
 qPOeoNZXMQ8cbD5UQ2jMhruxAC+Vl/4EjiP6PFqCS3T/aAdS1woejOhR1gDoTH7+4i0Bp3Ptj
 UdAcOxLkCguFFKgc/ZlNEEEgaq5DFsP1uzs
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

On 6/26/22 12:28, Helge Deller wrote:
> This series fixes possible out-of-bound memory accesses when users trigger
> screen resolutions changes with invalid input parameters, e.g. reconfigures
> screen which is smaller than the current font size, or if the virtual screen
> size is smaller than the physical screen size.

I've pull this series into the for-next branch of the fbdev git tree:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/log/?h=for-next

Helge
