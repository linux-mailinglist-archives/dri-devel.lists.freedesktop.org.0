Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6E37F27BE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A3410E29A;
	Tue, 21 Nov 2023 08:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6C110E29A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 08:42:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0EE3E61701;
 Tue, 21 Nov 2023 08:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037C0C433C8;
 Tue, 21 Nov 2023 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700556170;
 bh=s42Wy/PSgBWqU30V33nYxLqE/eIP2AdBSScg2nPIBSg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=C8dNPHPbzqj9qpvY1zxJ6ca77mO30Jo11bL5O30YdbgImcCAvuV9HhdaoU8B57Fas
 6zr4slaeRrxKi2d/pyApKrjLoYmm+PWE4g+z4wCeSJvyXDAhoNk8vHZo+NJ+jegt6d
 vCOJntjmUMNzA3lWHr6WAx402mlHmkq45jp+4bUypQ+OtUJBGXzQqBXrfOrdlrFw/5
 9S+REn7ea+O9GBmXVYuBOfig+ATPZ4fagDAGsPVtzAmXW2bCakKhLtXzquFQa6PQQk
 86K+9Z1/dwRix/rhxBYVQYzJ1x/kPHK/o93Z3Ztkjr8EiOo51Rfg4TdfW5fJiv7RDa
 pMsseDWJqL3Gg==
Date: Tue, 21 Nov 2023 09:42:47 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 11/32] hid/picolcd_fb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-12-tzimmermann@suse.de>
Message-ID: <nycvar.YFH.7.76.2311210942200.29220@cbobk.fhfr.pm>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-12-tzimmermann@suse.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org,
 =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023, Thomas Zimmermann wrote:

> The picolcd_fb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org

Acked-by: Jiri Kosina <jkosina@suse.cz>

I guess this will go in as one series together, right?

-- 
Jiri Kosina
SUSE Labs

