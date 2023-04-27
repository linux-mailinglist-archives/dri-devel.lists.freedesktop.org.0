Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60456F01F2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 09:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12BE10EAE0;
	Thu, 27 Apr 2023 07:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxout4.internetbrands.com (mxout4.internetbrands.com
 [98.158.192.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD0310E116
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 00:47:36 +0000 (UTC)
Received: from la1-kvm184.internetbrands.com (unknown [10.16.82.5])
 by mxout4.internetbrands.com (Postfix) with ESMTP id 0D8787BC0317;
 Wed, 26 Apr 2023 17:47:35 -0700 (PDT)
From: kernel@linuxace.com
To: tzimmermann@suse.de
Subject: RE: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
Date: Wed, 26 Apr 2023 17:47:34 -0700
Message-Id: <20230427004734.23923-1-kernel@linuxace.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <a8fde333-0e27-f0f4-44fa-9291927c4a3e@suse.de>
References: <a8fde333-0e27-f0f4-44fa-9291927c4a3e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Apr 2023 07:38:49 +0000
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
Cc: kernel@linuxace.com, jfalempe@redhat.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 3:15 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Oh, now I got it. This G200eW is broken. The other one is good. And the
> kernel is also broken on the G200EH?

Correct, which doesn't make much sense.  I have two Dells, both of which
have 102b:0532, but only one has no video.  On your second point, I do have
a number of HP DL360p G8s with G200EH [102b:0533] which also have no video.

Phil
