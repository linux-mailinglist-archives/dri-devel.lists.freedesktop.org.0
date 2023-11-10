Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 444FD7E7B6B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A9D10E983;
	Fri, 10 Nov 2023 10:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765EA10E983
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699612775; x=1699871975;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ktdtSKOA9fil4F06AF8zSWq3uMPFOkrgZZS6atSxG4D6py1timaFJz9vuwidShDJf
 V2RIS55K9uRYUGW+4sHxFX3FGI3PF0YEihYKn+pDU+b8CIaK2JujJxhx0/jILFCkXp
 QNshvnRllSNMTK6TxC0l4H+Nv2RvnI5qaEFMkBHwoLEdK3A7yuxpSOM0l3iSt19iVJ
 KYqxD1MIJAE/KasNMSmL3VXPEAW7nQv5zp58jNLVF0/eXgkWKYIDTbo3BLXWfTU/0b
 5uXlUc4LuM+nOgHRNCJN7w/KrC6Gaare/kFQOEczKwMhvJEXHiZXC+PdT04ytZNcAL
 uPLKuIMxg400Q==
Date: Fri, 10 Nov 2023 10:39:17 +0000
To: Javier Martinez Canillas <javierm@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 6/6] drm/todo: Add entry about implementing buffer age for
 damage tracking
Message-ID: <Qk7PzUNb_mQOUoclJb_UZkCxPr6GpbX-DftrnR9OKDwSfdDHuwhUnOXbqKU-M_v6q1YgEphShJYnc9o-LW7pN6bMOiNbpcVBsrDvUofFs_M=@emersion.fr>
In-Reply-To: <20231109172449.1599262-7-javierm@redhat.com>
References: <20231109172449.1599262-1-javierm@redhat.com>
 <20231109172449.1599262-7-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
