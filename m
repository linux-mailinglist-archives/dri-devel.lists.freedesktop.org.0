Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA3B2C94C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 18:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD2610E04A;
	Tue, 19 Aug 2025 16:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="YQCo1gge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE0610E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1755620125; x=1756224925; i=markus.elfring@web.de;
 bh=rFPwxh0Fwj/iCYNbZAYnORN+8ShZscXdh6Ni/qKNArA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YQCo1ggevkLcZMFEhwyx4VwesrFIBcf5xg9d9D+CiQy0xf5Iw9mZgx0JA+auQc6e
 ff9CKxQfkZpbenXZUSairVBnwA8c0+9R4m2hsJTF4neg+e6R5cVYmjzqGlfaT7dre
 ILjks0BcZHSp1Jb2CI9vSKTZPwbyUeI4NDkvkvYhkoJ/fdfmeQpgKMYbaOuCmJTPf
 3erhLy/zYIOc3uP04uVRXcwVx8tL7XxUdUeUIQ9yeNMwLNrTtO1QJ18ExBxd38Icy
 fl0uZK2oTDPqP36eWPtO1G5GoKRxKZhdBlyk65Rc19YPFJntqMqyMSDLJY0olzo0i
 I0/GjTTIxK2kdwhLeg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.248]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWQud-1v4gQY0eWR-00Vxs1; Tue, 19
 Aug 2025 18:15:25 +0200
Message-ID: <acb4e709-a42f-4591-a406-7745bcd0422f@web.de>
Date: Tue, 19 Aug 2025 18:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250819142630.368796-1-liaoyuanhong@vivo.com>
Subject: Re: [PATCH] drm/sched/tests: Remove redundant header files
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250819142630.368796-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:N6HaCa9pJMpnG5YFymg4wJud6xXjJKqKHK54aZAbaK91Bnzkogx
 Y3/kCqkxnviVgMdS0qSG6Bo2r6xX0j3kEuZHiMk2wkOlwaidj/DVPiiCdX14YGoNLZn+t3U
 xgjdo4CBN9Z62E8sGyNmfkm7cgF2+dYhqPecPtaRVgJTpBD5vwVrGGU5nESN0C8SVOCOyX2
 cv96GYgz36KkwYSj7ehtQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jlsom9YC+Lc=;dC951pIrPgk0zSW6W+p0jJHcRxm
 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
 McYWjcy21ioqK6Gh7qVqVtDU3KPB
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

> The header file <linux/atomic.h> is already included on line 8. Remove the
> redundant include.

You would like to omit a duplicate #include directive, don't you?
Will a corresponding refinement become helpful for the summary phrase
and change description?

Regards,
Markus
