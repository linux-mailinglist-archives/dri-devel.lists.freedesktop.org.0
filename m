Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E49423B4F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 12:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730086ED9E;
	Wed,  6 Oct 2021 10:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95116ED99;
 Wed,  6 Oct 2021 10:15:22 +0000 (UTC)
Date: Wed, 6 Oct 2021 12:15:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633515321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzhOopOiQjVdHREVS6WWzBcImsM1l4/BHgs/eCC4K8A=;
 b=INKg+7W3lD/dz477LrSHOsCpgAkDmDnXH2Mi+sKCBhlDyySVVpm6yV+VdMdsGQuX7IG6aV
 9VxaR+JwXShyfkhJZIez5dglkRIaB6tnZLxaTiclIrUzpTe9wX2Ah7o4jGJp4pwDayLWmn
 yr/ZTeStOZZ3bt34FRkIDtSAjyOj2vbK12Kcqwi4Z2JMWR775+temRALJ3l6NR1RJFlV06
 KXiWe4maPrxnUevd/Qa7jMRufDIZsdDXMs/cKXULxIhIFCj4QrMAtY4hc9myMeN+/iE+jq
 oXItle6E1byo/TsTY5zz0S9dOA4zrh/gmeYN8Ikz1WzhxxDmfq/VxiofHc3gLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633515321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzhOopOiQjVdHREVS6WWzBcImsM1l4/BHgs/eCC4K8A=;
 b=RuA3eqShVPUdwFcnCCvOUdpNpIb4II+09MBd70YnFE5PMLmXdRBu0IY/dhLr9pde+ahyIc
 jFe0WRRIQjbaOIAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Luca Abeni <lucabe72@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 3/8] drm/i915: Disable tracing points on PREEMPT_RT
Message-ID: <20211006101519.ffwg7u7epzl7dedl@linutronix.de>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
 <20211005150046.1000285-4-bigeasy@linutronix.de>
 <YV1tm8bNEBbPeU6/@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YV1tm8bNEBbPeU6/@intel.com>
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

On 2021-10-06 12:34:19 [+0300], Ville Syrj=C3=A4l=C3=A4 wrote:
> I think the correct answer is to make uncore.lock a raw_spinlock.
> Without the tracepoints deubgging any of this is stuff pretty much
> impossible. We also take that lock a lot.

Let me check if that works.

Sebastian
