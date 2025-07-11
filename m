Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ECFB016C4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 10:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8708310E269;
	Fri, 11 Jul 2025 08:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PuFlMSpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE15610E269
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 08:48:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso899127f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752223706; x=1752828506; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EVvoYtci3kiNqx6q9TloOgIWKUAYnim3SmsIFtu6m6o=;
 b=PuFlMSpj9q0POmCjDFStdhlrcYb5M1HlS9qwyOLBEEHaqGwVQLR2c2ZXLDX2wfWHWX
 BtN49U2ECPIx6kYYYDjtyGdCkdJCWK1Ay1lEyuJLltmh7EHHYHXfcLj6uMHlsrIOokr7
 ongKELin3U+wlM7nQES36yTMz+qHZ7KtSk3QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752223706; x=1752828506;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EVvoYtci3kiNqx6q9TloOgIWKUAYnim3SmsIFtu6m6o=;
 b=xHcdPV9trbS63lcnWks0lO/4trR5cMgIQse1YzMXFswh/RFoWtLRQn+suDmlN1W0l6
 rX4/gZ3M2ws7uihG+TQ1meZGbzI+4NSSuNbGRMPn/6M4o+w8HOuTSckCHpSCGyDt8pgv
 CO1hjN57nhB0d78qK1FvvDyHjJpxb4FZS8pMdvPDfAEMv80CkDB/M7DTBlCwaDS9G8Lh
 62pcIPnqzqwMhVwAsQNOzpvd1Wx0PvYi9oKdIZhQbY/30UxItqJ9fbvyGy5STFitjJFz
 Wjki/x8BWSgAnFw/36Pzemv0VqEAldmOUoPabmi3LVwyIvAkD1mgWrw9cv5wsofIdCA6
 NjlQ==
X-Gm-Message-State: AOJu0YyzdjTiMQnrwasogM+XsqNQehn7gD7OrqS6qXbZzSMG/sSMo+Zs
 4QANoRvnO+EVRK8HrHYGPjBmQU5ysExYNmCoOsgreRvOEEJsf+arQWgXdzS17y5pOYE=
X-Gm-Gg: ASbGnctAXRsqwVokXoynqjDk4afDZpQg6US0VcJ90kBC9Pv3kMHb9g1w/MKP7MMi9dV
 9cf+MTFFAuPr0xDNMOtlcWfJSa6HXh/W5SnikjG+bJAEpEgGVcT+2+GL2shZZFLWeY0lRoi5ODb
 vmkW1vZL9RWJnnoGUctBXJSDILGpbAJKfvMpNjGlSfdC7l7Zvi7E7QjYg595JGfdt724g2muvYO
 hYZxsT3/5DEM+qbIIXhaVeolx787cIQvbpUuVLdr5ekgHx8mrTtKzFMapqyeCXoQghpCs0tdryd
 TpyqQnrdmw/2HaNsfU/Mv0+R07RnCH5KqT3k+NIP8Tm8Fdcf2Vd/UzU57n2j8O/fZR6GrJE68v0
 beFmouWOQU5qbd7T/H9wVZuekLvCfV/5/cw==
X-Google-Smtp-Source: AGHT+IE3+XAFvgcqByafv/K/2f8xYUaImtDEjT7FLgE0fyQZnksemCcItAXNSk43knIt0KmsRLmlsQ==
X-Received: by 2002:a05:6000:2dc2:b0:3a4:f50b:ca2 with SMTP id
 ffacd0b85a97d-3b5f187591bmr2247830f8f.8.1752223706136; 
 Fri, 11 Jul 2025 01:48:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1924sm3964101f8f.16.2025.07.11.01.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 01:48:25 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:48:23 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Turner <david.turner@raspberrypi.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions
 with atomic
Message-ID: <aHDP19Ny6MEJlS75@phenom.ffwll.local>
References: <20250501112945.6448-1-contact@emersion.fr>
 <chRMluYufVIQOwgvGCTE0bDiRwi69U-MECSebFV3mto1c2_MKEZyVuslrvJgdzusI_CBhz86NSx4oeeClWmZxc_zq1UnCUWlvOVlv9lIyGE=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <chRMluYufVIQOwgvGCTE0bDiRwi69U-MECSebFV3mto1c2_MKEZyVuslrvJgdzusI_CBhz86NSx4oeeClWmZxc_zq1UnCUWlvOVlv9lIyGE=@emersion.fr>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Thu, Jul 10, 2025 at 08:07:40PM +0000, Simon Ser wrote:
> Bump: would anyone be willing to review this?

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

I did check the parenthesis about CRTC that are off and stay off just to
make sure, that code is in drm_atomic_crtc_check() at the very bottom.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
