Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA35469A82C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3C810E1C1;
	Fri, 17 Feb 2023 09:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC2F10E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:34:03 +0000 (UTC)
Date: Fri, 17 Feb 2023 09:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676626440; x=1676885640;
 bh=xgBbV/NGSqeZu+lBDaArqZlzNjavceHqvv8Rah8h0gs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=MPChJ/ArNZXIDU9PbrmNLclHJPLcFit4dq1AqvkDjKacbY2NcS9e3Hi82+DyuRgbn
 zehJ6xKpqfdgMj8pDaZrPHythnSIjN9yjzAuAc7u74oQ0T/W50yuOdvuz9PA26oUvb
 Q+6WuykpQlIxzxIeon34C27ktNOKbWb79Coz2Upj92TJmUh+IwmiL2+h+U7K8nBhM/
 zQWr8+HqgobC1/xjwGByKmveHL7JYGvRcbrdpEBpN01ESMWJUrf+tKudq1o6VhBxuh
 VE1s7mNI06YGhhoIqx1KzsunAlHiWUzio7yTuh3RZa61OXnVJNy5b/0ppSw7yB25j7
 HAjMrvt0Wi/ZQ==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm: document DRM_IOCTL_GEM_CLOSE
Message-ID: <sa9T5WJMEK1K-TspRPOwD-SkuoMTZfEXL2FH2AgxOZWCWjQs66h-gvsG3ZOtjKVNA-ponbnhfHD2rVYPOyS6fFKLS2YnU-HBUhzAVD8lI0Q=@emersion.fr>
In-Reply-To: <Y+6IdQz1MNj9k+8K@phenom.ffwll.local>
References: <20230216130934.156541-1-contact@emersion.fr>
 <20230216130934.156541-2-contact@emersion.fr>
 <Y+6IdQz1MNj9k+8K@phenom.ffwll.local>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, February 16th, 2023 at 20:48, Daniel Vetter <daniel@ffwll.ch> =
wrote:

> I'd duplicate the relevant parts into each ioctl doc too, just to increas=
e
> the chances people notice these caveats.

Hm, I'd rather not duplicate, this makes it very easy for each version
to go out-of-sync with the rest. I will add links.

> But that's stuf for these other
> patches. for this one:
>=20
> Reviewed-by: Daniel Vetter daniel.vetter@ffwll.ch

Thanks!

> btw do the links from on ioctl text to the other work?

Yes, they work fine.
