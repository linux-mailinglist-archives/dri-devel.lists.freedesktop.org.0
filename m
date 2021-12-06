Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51151469C6B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 16:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609466FC85;
	Mon,  6 Dec 2021 15:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8E6FC85
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hcMg2AjETr1fiEpXEIG2Oc9zlYNjaJy6kRSCTvq5+G4=; b=wT/7epHl9oCiVZy7F0E8TBX1YW
 bl2JMCgz5Ynperms6xl48c3/5SVPMonnaT2kHDQRuv3QLVmFKEoWkGUJALWiECAZFSGvgiZDEVM+E
 3OVJzFcCBLXESsXWPx/SgQGby+/zJi7EPF+V6coIfS7akgmvOKiNmhTP3JdXBGTZ80tEbv9c96jvT
 SQmgdt3ssKxUUKUJUtPFj+2Q/7oYjq3xJfB7B1/Lyn0RDiQXR6oTjVd7Eelbvk5ddt6Mt3nPVyYUn
 6AFaWoDGa0vQKklwvGHuLPDuK5n9mkaZhIvxzDd/5vAXFpKJn3p81yTuxDGqEj+ftDZyXSARXCNtp
 eoaoZQLw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:49492 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1muFlG-0006Ll-EO; Mon, 06 Dec 2021 10:18:41 -0500
Subject: Re: [PATCH 1/6] dt-bindings: display: sitronix, st7735r: Fix backlight
 in example
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, robh+dt@kernel.org
References: <20211124150757.17929-1-noralf@tronnes.org>
 <20211124150757.17929-2-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <f86889af-6f00-2263-afec-64aa9b56ff04@lechnology.com>
Date: Mon, 6 Dec 2021 09:18:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124150757.17929-2-noralf@tronnes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/24/21 9:07 AM, Noralf Trønnes wrote:
> The backlight property was lost during conversion to yaml in commit
> abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema").
> Put it back.
> 
> Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema")
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---

Acked-by: David Lechner <david@lechnology.com>
