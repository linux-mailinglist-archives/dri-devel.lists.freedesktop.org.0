Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59566693943
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 19:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4C410E1EE;
	Sun, 12 Feb 2023 18:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8DB10E055
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 13:56:48 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PF8Cc6Pvkz9sSQ;
 Sun, 12 Feb 2023 14:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676210204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FczVmXhgWDsSvXajJY85Vq5BsU6XlO1BFQUzsdrxudM=;
 b=1AW4SkDi8lc6WBa0xSKf3RFPs7jdbnOCo6BPejAmrhVgImF6nBr5AdCakeO4/QzKW1VAlk
 ZiEKmZorlqvq7efnw6+NfVwpOkbsPbtv/VbAKErI5h/sJtGzCnirxONMS+Pm/IWg7D0bdn
 nJFbx1p3/PxzNJDwdKLpGVckO2iDdozVavDp7Nl7rEIAwPxTXPGWGn9cpMViKnYkiKLgXK
 fHssQNR/be6Yb9MjRPsd6exvVegCTGApCcYcMmeNUdCNeerZtPzKukmkAgPNYrYATS74Dr
 mXEcVy8jADxzwv1E1a2E9jkDu8PGCItZvXHxCkDYhd5/zaCCGRColdWyEOgudA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Fix resume of XBD599 panel
Date: Sun, 12 Feb 2023 14:15:43 +0100
References: <20230212120830.46880-1-frank@oltmanns.dev>
 <20230212120830.46880-2-frank@oltmanns.dev>
 <20230212123621.jo56yqlburd6g6ir@core>
In-reply-to: <20230212123621.jo56yqlburd6g6ir@core>
Message-ID: <875yc70yxy.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Mailman-Approved-At: Sun, 12 Feb 2023 18:11:01 +0000
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
Cc: Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

