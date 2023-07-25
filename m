Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD67762483
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 23:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9511F10E19E;
	Tue, 25 Jul 2023 21:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC6C10E19E;
 Tue, 25 Jul 2023 21:32:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B543618EA;
 Tue, 25 Jul 2023 21:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5255BC433C8;
 Tue, 25 Jul 2023 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690320776;
 bh=6koY50l11od8QxZowt9EtG4lqhEmlEzPITDh/N0Q/8Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=AlJa1Lh2MxGgjfDu1nB2BimBZ64+gnm6HyY2ap07l0vUlfiPD5c8AGRCJQIhiEn/a
 cDLa9C+KoMEOxFPWdElsWKsAa3CV79IvL6N59m31WQCdzCCt4qYXFbq5Et9PiYTfFm
 at80aIsmg+eSVFQjrFgx1IA+i0KSPu22JJGKBxB7Yh9jYZisPgLZyF42OCvM4oKYOH
 0vES2jrNODH0oDDU+lfrYLIF4koOrB9/6bo4n1ktThdQ2GsCTTbBzLca6hHYrv3Ui/
 rmWvJK8PkXMvyoNqUosYM+TYQNUb70w90HVlyFqWI81Abe0KjbNwwrXCS3oxYkErG9
 +qHfvfhBYBulg==
Date: Tue, 25 Jul 2023 16:32:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v3 0/9] PCI/VGA: Improve the default VGA device selection
Message-ID: <20230725213254.GA666777@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cb6fd14-4661-4285-ac5f-c8f6ea1f4208@loongson.cn>
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 08:47:48PM +0800, suijingfeng wrote:
> On 2023/7/20 03:32, Bjorn Helgaas wrote:
> > "drm/loongson: Add an implement for ..." also solves a problem, but it
> > lacks a commit log, so I don't know what the problem is.
> 
> I have already telling you one yeas ago.

The patch itself must be self-contained, including a commit log that
justifies the change.  You may have told me a year ago, but that
doesn't help somebody looking at these changes next year.

Bjorn
