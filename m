Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22DF6293AA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 09:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818C310E117;
	Tue, 15 Nov 2022 08:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE3610E117
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 08:55:21 +0000 (UTC)
Date: Tue, 15 Nov 2022 08:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1668502519; x=1668761719;
 bh=g2STE/b/URYY8t/bhpPvfdNvy6/pw2IjdVcUng96yQE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=e5vZqfuVoY5FAzYvxjN5C3vMPUHoryiMIaWsz6cWbmFMgrTafZEQg9So1K7R0r40H
 VsnM9BPqjTTgM7UZItL1Sx7u22IoXT4aZP3VQkYpr8qxiSxGrj1e98jD4Hjzi85FYk
 t5b2vatWONLhfD8ks9frk0zve9kv8uYuR5j/jCK8xuqW3YhI5ZUhdCzb/kuJMQ8a7U
 qcbbvSy6EBr8qnJM05U9Y6rKlF4pUPTktQw7Jxfxc3d8gzL55MOzEMgkjAxdxAe4N4
 KqbJj3TQln9UyVZWjBd37q/lowlh+cv5elUXOxmBiFYMzabYN0OFaBgjfHuDJet16q
 z0YBO7fppmlSw==
To: =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] Revert "drm: hide unregistered connectors from
 GETCONNECTOR IOCTL"
Message-ID: <Eeerr6sqPNtw7uDqaovP1hJxjfKeDT3dWUY6vT0NpTJnA7bWHEdfnk7Vu7nDNKbK3OCBr-s3bTq1-acc9vGQ1vnGXTXxSCjwXteN7E7GGWY=@emersion.fr>
In-Reply-To: <Y3NTFY9Dz7eB9Uho@gmail.com>
References: <20221017153150.60675-1-contact@emersion.fr>
 <Y3NTFY9Dz7eB9Uho@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've already pushed both patches to drm-misc-next.
