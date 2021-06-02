Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0BA398513
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B096EC16;
	Wed,  2 Jun 2021 09:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E419B6EC15
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 09:16:25 +0000 (UTC)
Date: Wed, 02 Jun 2021 09:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1622625383;
 bh=D6+Q/YBEfS3jHCITHGthcUuBTrVXTfaANUhMVlhALIA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=rf7cRqdBNbJo9LE/YbnG369pA+7gOOIs1UfAPYG2FYAu3Y0n2T/uQryAKC4oqZT/n
 satpjWQwaHKhYOB1dJy7vqr9JzDpEQWd75CcHtceb8rOZW90VcCxvopQveVy4weih8
 X5VWweK4gXup2+QogOL1QLg3VJz+gvS10QlwgEQAg9x9RQAmVahwIqb31/AVUn6XlL
 CczHEqasHfhZLnii5cnl5pJSCFhLVhbNiHKjYimu2WrXUFyXpnBqEzWVxQpDzwAC+O
 DKUIz0t3uTl9b8GWoUcVekcohaCZNHA3LuGfoPhy1L967R+4zDV22a8IwJ4NhzNGb2
 RVIr6bEH4CqKQ==
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/7] xf86drm: Add function to retrieve char device path
Message-ID: <U1jbBlShrcZ8K1YtOccahqFpLii9JX-PhuZmcM2FgL-b9armKhfJq5kTFTK7JgQ0afiD60tXAh4nKuG3a7s83ezZA51uVPlFGjcLOusaiLk=@emersion.fr>
In-Reply-To: <20210601201702.23316-3-andrey.grodzovsky@amd.com>
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <20210601201702.23316-3-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alexander.Deucher@amd.com, ckoenig.leichtzumerken@gmail.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do we really need to make this a public API?
