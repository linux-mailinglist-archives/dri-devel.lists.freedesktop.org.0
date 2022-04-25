Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5850DA24
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 09:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC81510E096;
	Mon, 25 Apr 2022 07:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F18112090
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B9WB+hwhosJvYbo65GHTbgrVCXpNO9OFYMi8Pd4ssjM=; b=oGM378hpwyyWgNK+VOIA1H0x7u
 WtffthAd0NQPAVqMFccjAax977qkbil5cGtMEF50TXta1rBKXer3eWMh0HcGudRb8WPBY8Rj4POso
 rPt4H6mv+Q84MHv3IW6y74Rn8eH2LVIfIoarXYimaKR8KvKfFiNOJmI4TZ5/aPwU2CXksdr8uCmQC
 j3X19KKGSDUMPVNHXowbu2a6WJx+OlNWWlz8wQDfyszGRhXvz85GIFVF5Giz5ZldYccQ2pV0AXk5H
 XExvNE3b2YOh3F1vzIP/3FLUAmj8NSavUmbnERzRhFPGVVDEn9eNVjCJAZpQNLCJmNanv02ZYb9BH
 nu+Gdy1w==;
Received: from ip171.dynamic.igalia.com ([192.168.10.171])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nisrR-000CQI-LG; Mon, 25 Apr 2022 09:10:17 +0200
Message-ID: <890f6416ab37e40c929d95a8b4dcc8feb3dfb4d1.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Fix null pointer dereference of pointer perfmon
From: "Juan A." =?ISO-8859-1?Q?Su=E1rez?= <jasuarez@igalia.com>
To: Colin Ian King <colin.i.king@gmail.com>, Emma Anholt <emma@anholt.net>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Melissa
 Wen <mwen@igalia.com>,  dri-devel@lists.freedesktop.org
Date: Mon, 25 Apr 2022 09:10:17 +0200
In-Reply-To: <20220424183512.1365683-1-colin.i.king@gmail.com>
References: <20220424183512.1365683-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 25 Apr 2022 07:30:59 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2022-04-24 at 19:35 +0100, Colin Ian King wrote:
> In the unlikely event that pointer perfmon is null the WARN_ON return
> path
> occurs after the pointer has already been deferenced. Fix this by
> only
> dereferencing perfmon after it has been null checked.
> 

Good catch!

Reviewed-by: Juan A. Suarez <jasuarez@igalia.com>


	J.A.

