Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AC4047D7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 11:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434CD6E4AB;
	Thu,  9 Sep 2021 09:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E666E4AB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 09:34:48 +0000 (UTC)
Date: Thu, 09 Sep 2021 09:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631180086;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Zr6kw1t11YRwFlGZuurT+Y1rxqpUZisEEzTRiOrt6fn5Wou1fxNh36NGhwK6qpskk
 Sq0N1SjYFW1X7UHU/oa6wFAmKXQs3VGYYg9V2XQfQOjLCL8CGCYGGDBixqBKnMYDlw
 6PS4eaNOq7MH/xPMjoAB5Mpq7QZq5/UsBV2EV5ujVKQfUovq3PI9shu+pkNexU5Lti
 ov4tOG2GzyGcJ1/mE8L5bofB8MxWponmLLv3OllUtcRv1WIBzdY0vH4RbnVvqRLidp
 xE7KZm5pcOVE6YsyLWaob0W7hkM2g7crWVFf0ZFa5QzZgimDU31jM8/exdBd6lLJYU
 M/bamJd2BPUkA==
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/plane-helper: fix uninitialized variable reference
Message-ID: <BPJHmAoRYS9O-kvBP6sW8fAfyOEVZuL52c2JzwBDkLNPgIif_8YujX5jmluOmm-2ESW4A1lwqnfdCo4-QMYeryio1P4pkbfn7_TkhGlYi70=@emersion.fr>
In-Reply-To: <20210909013247.32743-1-alex_y_xu@yahoo.ca>
References: <YTkCQCPwZPbhMfeF@phenom.ffwll.local>
 <20210909013247.32743-1-alex_y_xu@yahoo.ca>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>


