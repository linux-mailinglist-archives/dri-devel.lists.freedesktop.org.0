Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E153FD71
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 13:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828AE10E080;
	Tue,  7 Jun 2022 11:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A9810E09A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654601163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwwDGaxtwKur2t94pb4K7GyXvqXH9WIBFsU7wJMVZbU=;
 b=PmAs/9wsG7WsmrLij+u0wyqsuwlphd0YLjcYANRjDv7LV3p/1Ej0vkotGpzzLDgmSP028P
 vvYYhIDr6uMMg1PDMTWli2k4THhkOrZmcOTxm2gsGq8S8EiiB4XO2HlYISJcLft4S1wUG3
 vy5Bq6gYAh7KOMtfbtG0/w47DxA9z88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-7AlcVE97O1qu9lnMBz7mxQ-1; Tue, 07 Jun 2022 07:25:56 -0400
X-MC-Unique: 7AlcVE97O1qu9lnMBz7mxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78EC8101AA45;
 Tue,  7 Jun 2022 11:25:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33604C27E8F;
 Tue,  7 Jun 2022 11:25:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A719E1800081; Tue,  7 Jun 2022 13:25:53 +0200 (CEST)
Date: Tue, 7 Jun 2022 13:25:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220607112553.vvesuy4wrnvfpjdg@sirius.home.kraxel.org>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
 <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
 <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
 <wgIEdQpY_K8Qlq_xWBLy4DHOGwKi0P2c8a5dnTXM4dKOsA2hydYyT9DC6T1ldVZmi_mduaTPi4fnidg1msOofUUKkbnal0-Vv3VuTnfZh0s=@emersion.fr>
 <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
MIME-Version: 1.0
In-Reply-To: <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> I don’t think I see how that fixes anything. In particular I don’t see
> a way of fixing the old user space at all. We require hotspot info,
> old user space doesn’t set it because there’s no way of setting it on
> atomic kms. Whether we expose cursor plane or not doesn’t change the
> fact that we still require the hotspot info.

Not exposing a cursor plane at all forces swcursor, which sidesteps the
hotspot issue at the expense of a rather sluggish pointer updates
because those suddenly require a round-trip to the guest.

take care,
  Gerd

