Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67842A54F67
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E0910E20F;
	Thu,  6 Mar 2025 15:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="brRj7c4d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B9210E20F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 15:44:31 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z7tyK4Gwpz9t32;
 Thu,  6 Mar 2025 16:44:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741275865; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=biIdFna/grGJzohmgaav9daJeJSsg/TtEXlTlxgdbVA=;
 b=brRj7c4dQxY7MnwR/0peFKx9+sNJ13pfqEB5h3zgR1Ti2TthLNJt+FN0ci6y4kigUsThb8
 qI+Kwf89ovsbIiiR/oBYyD0vQpbggxTvmlgC1YKxw/h7OnZ2Xx/8KRosNi2sTGQRuft5PR
 qIgvvz5FFTkYC8/6F+iD7m3MG2l8vB/9iKeEpj1LeL30JuPTXrCEvMsI2kuSDyjHJ3j0qX
 ulEkmga6UFqoUlWXzeTHlBoC/0VvZCSVq4dA5UHQxe/HofvnSleqrfleT7yQrw+Hq6DvAt
 hGmnYZAQLQI22UIqLUaUNcOhlWZ4AveBO60fnoWcUp0ruv1Oa5ZKcbO7khYL9Q==
Message-ID: <748519f2ce93d2692c1f32a6ca0950304a3000fa.camel@mailbox.org>
Subject: Re: [PATCH v7 0/3] drm/sched: Documentation and refcount improvements
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 06 Mar 2025 16:44:21 +0100
In-Reply-To: <Z8mxFslgK-XE3EEX@cassiopeiae>
References: <20250305130551.136682-2-phasta@kernel.org>
 <Z8mxFslgK-XE3EEX@cassiopeiae>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 330f8306d4355ca7471
X-MBO-RS-META: ex6q1jypofhiuswrwh6cggk6tory7phb
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-03-06 at 15:28 +0100, Danilo Krummrich wrote:
> On Wed, Mar 05, 2025 at 02:05:49PM +0100, Philipp Stanner wrote:
> > Philipp Stanner (3):
> > =C2=A0 drm/sched: Adjust outdated docu for run_job()
> > =C2=A0 drm/sched: Document run_job() refcount hazard
> > =C2=A0 drm/sched: Update timedout_job()'s documentation
>=20
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-misc-next.

Thanks
