Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593679E1BE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 10:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB23710E47B;
	Wed, 13 Sep 2023 08:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 389 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 08:14:54 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1A710E47B;
 Wed, 13 Sep 2023 08:14:54 +0000 (UTC)
Date: Wed, 13 Sep 2023 10:08:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1694592501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OLz2rtUgv2Z8NClPDFUwHJGTb8g8Amno78204f1tFg=;
 b=Ul5zVKC/Nw9Fq7QMQwOX0A1FDC4dyLS5rIqQOJcSKAb/SsGe8YDHdXfuX+r2ASfXOlLpb/
 srdgU3tnD9Pn33hwIvX1MnWgOH4YqI6Rr7KVKf0GjrC5vSDkgrT/oiMxHWcIuj4PlbxOsi
 +IO88SxxtRObECZ5b/rsW+8TA33/o9zN2utRbnEwQedXb5NhwFF2gpK6V+5njMrJjWmC3c
 mduE8MPxJi18kGXVx/91dpndJO/FBPrkoxygz0buZbzJO4H1SHVRdGaaYIIwITwy+smaLi
 MAUaJlbJNtwyomD5pajplT8zTuP39+P/08bJg43+6z5uxvbkLFbAdOyLgawNxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1694592501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OLz2rtUgv2Z8NClPDFUwHJGTb8g8Amno78204f1tFg=;
 b=tSuDXx0YBb2pRPzPuDwgqrz0l16cTmYhYyfXRvvMTVdoyZTV2m0vRfeaLTDlzb/3ql8w7E
 Abx6a+5/Fxu7Q/Dw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Do not disable preemption for resets
Message-ID: <20230913080819.xnpM7Ybx@linutronix.de>
References: <20230705093025.3689748-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230705093025.3689748-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>, dri-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-05 10:30:25 [+0100], Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> Commit ade8a0f59844 ("drm/i915: Make all GPU resets atomic") added a
> preempt disable section over the hardware reset callback to prepare the
> driver for being able to reset from atomic contexts.
=E2=80=A6

This missed the v6.6 merge window. Has this been dropped for some reason
or just missed by chance? Can this be still applied, please?
=20
Sebastian
