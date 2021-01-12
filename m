Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737942F3323
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 15:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A1A6E235;
	Tue, 12 Jan 2021 14:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB376E220
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 14:45:32 +0000 (UTC)
Date: Tue, 12 Jan 2021 14:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1610462729;
 bh=dJzUPrnwlwAq5qlyATrS/8GqB1QVkQwbrqW7NZTcAVQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=FPWTo1LcFtad4OBHCO0W2ySPzNpvT5Do9/RBMfvzHVq6bBORpY9SMhA8oq/vdQPAx
 LEh06t9RuinW47DJU7JNwHoOaov2XuklRA34P3IlHCU51IG47LRo6qTSxiN2H8Q7Dz
 KlaZYk9Cu09/u10CapKRqS1HiUXiclYvpBPYE0iKX57opmKD4PWC+xCyJlABNn55H8
 crqtH3OH4iXxtBjxa7cJdXxYqsfaCMsVzlD3q5UZYkJ902Num9MaziTmdNyvG7JMOS
 AZGKA2SYld7lrk0Ei69xN3ojkCXPzi7zI42xfLHGLa2uKbHmeAhOEIiyicY0vMle3s
 mcLsnhsVry0gg==
To: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: RE: [PATCH 1/2] drm: distinguish return value of
 drm_dp_check_and_send_link_address.
Message-ID: <db24bjCQ0UAbXRVNvbMpeYjRKJR-H1mvKckBU8dnpyFYzcsxDYY7dtbXYkYWwnWtOrXpcjNUNqsvM-e_0imcs5IzXzs5zpUs3wIowqwpGXs=@emersion.fr>
In-Reply-To: <fhO3DFK9BjC0oXptdSRyxVqyxYGUM2BV9bgl-IoQa1E8CiTQVz0BbZXGdqawwnkryfbVMeyVIBTYPOpBkOKca34wehM7OAKJOzBtWQo4ovs=@emersion.fr>
References: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
 <DM6PR12MB2602B6281BF8C9430115E03BE3AA0@DM6PR12MB2602.namprd12.prod.outlook.com>
 <fhO3DFK9BjC0oXptdSRyxVqyxYGUM2BV9bgl-IoQa1E8CiTQVz0BbZXGdqawwnkryfbVMeyVIBTYPOpBkOKca34wehM7OAKJOzBtWQo4ovs=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next with a re-formatted commit message, thanks for
your contribution!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
