Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2767ECFB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 19:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AE410E195;
	Fri, 27 Jan 2023 18:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DCB10E194
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 18:02:32 +0000 (UTC)
Date: Fri, 27 Jan 2023 18:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1674842549; x=1675101749;
 bh=G3N1dUBCoS3HUBukvqJJ/tzvPtsoCbWhZtyZKVUf/Uw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=nZ7r7awSwyh0CWD7LR7Uo8G18yAuRzK/BHVOCsJCTwZuLv48eWgTHHODREcaEqVRK
 4AXYVehhR7ffzpiV0nx/eZr78rXRozRr0v/oesPTBuYDgRQWKbeNtHuJJ8Dhtcl+yq
 y1jTt0yuURsHGOb3B3g7RllVa45/XyiDsRJ4MUtfXuKVUsJ5dY3lOU5D2qogZ3dAtv
 W6MNwOP0Z/DjpodbcuRWJlESPN7PEsXsW3U0QVJcYZZHCmcALXzXOdlp37/vksAC73
 XST6c/9eEfZnB1QQXH/PSZsAce7Gnkf39/x2odP6Gs5mYjDdWFzskWx2sqgGtGk6Qf
 3orddiMWiXAAA==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 01/10] drm/client: Test for connectors before sending
 hotplug event
Message-ID: <tc_igyYrgA_B5xJ15j6H2fQ00aA6vzd4nuQ8XusqeJqWWNZDJx8fFRgBAWoWOV8L5BEhjFDMYgANfdKXLqJZ0DMcsZfy8OUHDRatj36oOXo=@emersion.fr>
In-Reply-To: <20230125200415.14123-2-tzimmermann@suse.de>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-2-tzimmermann@suse.de>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, January 25th, 2023 at 21:04, Thomas Zimmermann <tzimmermann@s=
use.de> wrote:

> Not having connectors indicates a driver bug.

Is it? What if all connectors are of the DP-MST type, ie. they are
created on-the-fly?
