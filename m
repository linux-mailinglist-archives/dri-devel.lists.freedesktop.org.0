Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3D6B98ABB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 09:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A61810E134;
	Wed, 24 Sep 2025 07:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LI0m1oUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B135E10E134
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 07:51:05 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWptt2MFwz9tJ6;
 Wed, 24 Sep 2025 09:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758700262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w35ytcQqIqrLEbp+RwBnRkxDEeHXIs04oOLxsRWcUxU=;
 b=LI0m1oUFLTGdW8TyNvjljDbwW1nwoVvcXGTW7ws2BydMNKTgrrijv8GDBdGzZjn41RVZYs
 hb5AWQ9OnWfchFJ75P4tVWSyyecvvbBvn5eyEEsiGbL1m23yNq5AySxNX3SF8yeSTML5Ix
 G2ZuLfO/174zJwku+A3M3NPoLc58tq9d7D1L3vTQ+lsRI0+fPDXrXCEQNwik7qe0prulJn
 AwdRzM5kksBK5ceeT8dCYVFjwYDSZNnqfZ2cxqVo0Tbm9KqAbsKHmCAgXe2XN/yUHJJATT
 dGmDgXFfRoZlLArasLqDPjcIGawo9W7FSwJYvz/8/L2dXSe668VPBacaZv4TFg==
Message-ID: <58a6e042-1890-4d1c-88cc-29f500b0a407@mailbox.org>
Date: Wed, 24 Sep 2025 09:50:59 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
To: Derek Foreman <derek.foreman@collabora.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>
Cc: harry.wentland@amd.com, Mario.Limonciello@amd.com, xaver.hugl@gmail.com,
 victoria@system76.com, seanpaul@google.com, Sunpeng.Li@amd.com,
 dri-devel@lists.freedesktop.org
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
Content-Language: en-CA
In-Reply-To: <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 08473d759fd995e530e
X-MBO-RS-META: jda69wzxxz53wj4jnmhxuryjy6r649ui
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

On 15.09.25 12:01, Michel Dänzer wrote:
> On 12.09.25 15:45, Derek Foreman wrote:
>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>>
>>> This is done through 2 new CRTC properties, along with a client
>>> cap. See the docstrings in patch for details.
> 
> Not sure why a client cap would be needed for this.

According to https://hwentland.github.io/work/2025hackfest-notes.html#vrr-for-desktop-use-cases the client cap was intended for disabling LFC & ramping in the kernel driver. It's not really needed for that though:

If the min/max property values differ, the kernel driver can vary the effective refresh range between the limits and perform ramping, otherwise it can't.

If the effective maximum value is at least twice the effective minimum value, the kernel driver can perform LFC, otherwise it can't.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
