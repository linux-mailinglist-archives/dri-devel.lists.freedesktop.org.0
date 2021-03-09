Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A686B332CDC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 18:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15B16E4B5;
	Tue,  9 Mar 2021 17:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8D56E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eVJX4ZbIuo6pR2UJmRn+LH26yKYTe8SIJdmlJLQIS8c=; b=T0qc2C45/moPE0pzyelScgo+TE
 f1zFxwnQrLOAlpTU8+a862+1H3uSDtCmjQLOUZu5du65k+Q8Iw70Aj48YVY5s6cwm+K6TZ70vSk0l
 n14CWcVFeK3dN0KeHWzTwSyu45kp4Ut4QUXESBtVDBpbm4WZeISO6yzzPS6izRFKBJWJz4KIyByve
 xAcVoHSA3la1x5Wh6PtYSG8zEk6TpT38FhkypQkDD/HTA92lTF7cyg8CMts677aypCO26Ew9jTCca
 bXivlaUNPi3F1LGfg/MUuqsXcIOKFMjEhpYMyUtiIyrjIfIAlfHWjHlc77CXAtd/MnZ6qRk2Gcpqe
 RtZjc4rA==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=52588)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lJfqm-0001WN-6N; Tue, 09 Mar 2021 18:08:52 +0100
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Need -fixes commit in drm-misc-next
Message-ID: <bc4381ab-d9c5-b425-90c5-e01d87dcb576@tronnes.org>
Date: Tue, 9 Mar 2021 18:08:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi drm-misc maintainers,

I have this series:

GUD USB Display driver
https://patchwork.freedesktop.org/series/87044/#rev3

That depends on this drm-misc-fixes commit:

3a3fe21242a3 ("drm: Use USB controller's DMA mask when importing dmabufs")

I would would be nice if it would show up in drm-misc-next soon.

Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
