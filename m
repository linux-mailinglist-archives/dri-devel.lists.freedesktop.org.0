Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5CA19DD3F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 19:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576796EC56;
	Fri,  3 Apr 2020 17:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A2A6EC55;
 Fri,  3 Apr 2020 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+IMJCVeST6nXuR/AnU2HlHQOLr02RFQnr807i++47k=; b=NPV4jI9QTbNwXO9VBhDeTcCCCY
 XE5YA3bXXeQssxoT21n2XxeUlGMvA6q7H2XlVPBXzQlfSnuOJ5MVHGSF0wzYPeOYAV3zbDNfRxyQZ
 36xNVz28zOJ++Nqejp3uWoPpbL8VRxxyl8rPER2gL0ZUCRLHrBZzVNOka66yHs/HUf4ulzhUFPkaO
 4Zhz4CyntjEBtLvRwZLLQG6GEHKBrR39YWnJQdejZfn9kW/K5yVk9Sv5HNU5EABdOBFsECKL02Dug
 8PX17Yolz8Eqxo40seYBhEkbBC84UJ31Wchy+ykW66WmUoaIxPNu0hHpCS127cPsd+wIANPiVyO3W
 oLMpzNrQ==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:49658 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1jKPhC-00022B-Tm; Fri, 03 Apr 2020 13:01:31 -0400
Subject: Re: [PATCH 18/44] drm/st7586: Use devm_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-19-daniel.vetter@ffwll.ch>
From: David Lechner <david@lechnology.com>
Message-ID: <9b479feb-e4a4-3311-881e-109009a43b36@lechnology.com>
Date: Fri, 3 Apr 2020 12:01:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-19-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/3/20 8:58 AM, Daniel Vetter wrote:
> Already using devm_drm_dev_init, so very simple replacment.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: David Lechner <david@lechnology.com>
> ---
Acked-by: David Lechner <david@lechnology.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
