Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12DF725855
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02F210E488;
	Wed,  7 Jun 2023 08:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11A910E386
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 16:40:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686069610; cv=none; d=zohomail.in; s=zohoarc; 
 b=cxxZILsV0Ck3s4Pv6m2kv3XjsbugVskLts4ojIUyNRGoevSJ97cZz9y1LyG4Y0NHhttpQ1hmMkht3Ql6n+XXnQ+D9bsyJUhfazEYil0a0kSXepGxI1rshLjni2uIHI3sLD/4v7cFljW9gL0L7aKiRCMqjayM2Nhs5SK31B856BE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686069610;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=qKSjPJMWWmkJECp3tZYh7BuSC4IcgzJdVvdj6SWJe14=; 
 b=Nl0mQfdYRXZMRCOIPCkp5TIeVVnIUcRbW3xoHqeYVFEo7Oe3RCZ/iWC/vOLgRfuQMPBLaZtVXkgUD51XSsD9xuHzsQHKw0yI9AtHGwhqXGKq7e7XEdD12rdwwTPXcWZ+LqK68uv4K/d1hVb6bR93HO49qTbj+0Er+YfufbrsJ1I=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686069610; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=qKSjPJMWWmkJECp3tZYh7BuSC4IcgzJdVvdj6SWJe14=;
 b=l9qLXr7hIw2fBddDcXnpirDWqIqhWTcBDSXFZg2zo4k7m6lI7KXWLGcaVzg51zCS
 zbWiZKAk7Q4yL3uQ5vF1ckpeOUS/b9TwDjX++8U4MNs2VUDf9RJhxZspdkHef4znqGY
 U4H9M5BtOpsXTHf5755tVfDPbRtG5ZObbDzJxws8=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1686069579485900.0175054100046;
 Tue, 6 Jun 2023 22:09:39 +0530 (IST)
Date: Tue, 06 Jun 2023 22:09:39 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Message-ID: <18891940ece.3f2000a5125546.8342497114650501146@siddh.me>
In-Reply-To: <20230606144625.GF5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <52c8eb0f241a9d67ce5b7e6fc64dc397e735ccd8.1686047727.git.code@siddh.me>
 <20230606142322.GB5197@pendragon.ideasonboard.com>
 <1889125187d.5d36766d120183.6659725053490512400@siddh.me>
 <20230606144625.GF5197@pendragon.ideasonboard.com>
Subject: Re: [PATCH v9 3/8] drm: Remove usage of deprecated DRM_INFO
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Jun 2023 20:16:25 +0530, Laurent Pinchart wrote:
> I would write
> 
> drm: Remove usage of deprecated DRM_INFO in DRM core
> 
> The "drm: " prefix doesn't imply you're touching the core only, you
> could do a tree-wide change that also touches all drivers.

Okay, will send a v10 with the change after resolving discussions in
other emails, if any.

Thanks,
Siddh
