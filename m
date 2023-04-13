Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58E6E0948
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D0E10EA7D;
	Thu, 13 Apr 2023 08:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F74210EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 08:49:34 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-505050c7217so154012a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 01:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681375772; x=1683967772;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sijaRA9csYHk+QDl9FlXYhGP0StlKpy6z7FBZEoJClw=;
 b=PtDHsAiBZg/CrfdW3+ViNTDgGocGht9q6tphOmmpvcKYVA26yrLmlRSS9u0gHI/Zn/
 DJOEh/zzXqpQY/9EC6TjRXIjgyJnqy1hTaulP5abma4jA/I6MlK5HR/jqX1Q9ebsd4xi
 ebwSCmGQb+oaEOG2RbDfHhqQETur6Wy+XrcYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681375772; x=1683967772;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sijaRA9csYHk+QDl9FlXYhGP0StlKpy6z7FBZEoJClw=;
 b=dKht3OGMdJG/Lw22+GuV/HM1Q4/OZhSZ2lHterNKWcoI89CQ0DnBpdh58nLZtk/I8a
 rwezytki4RW7+SXpLwQnBAPw/Dmbhw9Yq360ooue15T7fNdY9QdyufVzWC0F96hKIbxt
 ZjVA5jar/4CeDqXSS+rMPhQPdf+g8WYxJN84PL+8tHJ8EwE3MCQHx2CtZ8FVx7aN/XIB
 VBxBHddCeqaS3D2jsiUcBexSFCYWkfagomORSX0hjpb2EJhTWcTVd0YoyNlenjuAS9Cr
 S9nzZw+qOY50O9aOa7zarIS16cTm+XAs3YaK8MzrcRtOIazGV+hvqRSVYB2uGVdTE0YE
 NMwg==
X-Gm-Message-State: AAQBX9eFhvrvMJ1FA2MW4k67oCiic/YG+tIwtuuBMD1mpoON0/hgtzbM
 6ezOTsNHGS3O8RjshwkUip205P28LUnXiNS/bds=
X-Google-Smtp-Source: AKy350aUV1nyhnQwiZ5Apo2QV3oDfYQiO15+DXNmy9wUYEy48bG3MnWmMH0L0drTzlm7E6J8N0pT+A==
X-Received: by 2002:a05:6402:518d:b0:502:367:d5b8 with SMTP id
 q13-20020a056402518d00b005020367d5b8mr1839707edd.4.1681375772088; 
 Thu, 13 Apr 2023 01:49:32 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 j19-20020a508a93000000b00501c2a9e16dsm552679edj.74.2023.04.13.01.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 01:49:31 -0700 (PDT)
Date: Thu, 13 Apr 2023 10:49:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH] Revert "accel/qaic: Add mhi_qaic_cntl"
Message-ID: <ZDfCGXPCFkb20jNW@phenom.ffwll.local>
Mail-Followup-To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, sfr@canb.auug.org.au,
 mani@kernel.org, greg@kroah.com, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_pkanojiy@quicinc.com, linux-next@vger.kernel.org,
 jacek.lawrynowicz@linux.intel.com, airlied@redhat.com
References: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
 <20230412140542.GA3141290@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412140542.GA3141290@linux.intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: sfr@canb.auug.org.au, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 mani@kernel.org, greg@kroah.com, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_pkanojiy@quicinc.com, linux-next@vger.kernel.org,
 jacek.lawrynowicz@linux.intel.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 04:05:42PM +0200, Stanislaw Gruszka wrote:
> On Wed, Apr 12, 2023 at 07:57:44AM -0600, Jeffrey Hugo wrote:
> > This reverts commit 566fc96198b4bb07ca6806386956669881225271.
> > 
> > This exposes a userspace API that is still under debate.  Revert the
> > change before the uAPI gets exposed to avoid making a mistake.  QAIC is
> > otherwise still functional.
> > 
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

I think Ack from Oded would be good (but iirc there's some holidays going
on), but I guess Greg's is good enough. Can you pls push this to
drm-misc-next-fixes (it's open now for merge window fixes) since Jeff
isn't set up yet?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
