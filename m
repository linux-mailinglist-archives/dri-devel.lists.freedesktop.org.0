Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD7D87AC66
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C2210E941;
	Wed, 13 Mar 2024 17:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386D610E941
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id E61A4A025E;
 Wed, 13 Mar 2024 18:06:49 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUxiADeTrGeV; Wed, 13 Mar 2024 18:06:49 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id CBD95A022C;
 Wed, 13 Mar 2024 18:06:49 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rkS41-00000002LOV-2Jzo; Wed, 13 Mar 2024 18:06:49 +0100
Date: Wed, 13 Mar 2024 18:06:49 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Alexey Gladkov <legion@kernel.org>,
 Jiry Slaby <jirislaby@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbcon: Increase maximum font width x height to 64 x 64
Message-ID: <20240313170649.bl45jv3r3qxzymfh@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Alexey Gladkov <legion@kernel.org>,
 Jiry Slaby <jirislaby@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240312213902.3zvqaghlopjusv6m@begin>
 <20240313174531.2579df0f@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313174531.2579df0f@booty>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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

Luca Ceresoli, le mer. 13 mars 2024 17:45:31 +0100, a ecrit:
> This patch is clearly not formatted according to the standard format
> and it does not apply with 'git am'.

(Note: the failure of application was not related to the formatting at
all, but just a little fuzz for the static word in

static struct fb_info *fbcon_registered_fb[FB_MAX];

that git doesn't seem to be able to just cope with)

Samuel
