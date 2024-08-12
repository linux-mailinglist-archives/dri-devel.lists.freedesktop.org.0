Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6158B94F80C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 22:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9881410E25C;
	Mon, 12 Aug 2024 20:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="XCgtS0qM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3953A10E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 20:17:29 +0000 (UTC)
Delivered-To: vignesh.raman@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723493846; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VeAOvnMYAfqeYet4+etWygTHbonxIofv3j0KFgRfdga0ZA8AxYB44sSyLeScmNkOazuVHmhB3DtNpT7n8d1e3J+17taGc/BHI/hbwR1Klu7uxUI66vEbkpXCj3pJJs+PpybfSW57QI8ZJgsvdvtpjxMMJbrADhJad+yQ0ATwnF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723493846;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RssbRFWVdYwnPLzi6GIn27T9Y1lbXl7o9x32vtJ+4f8=; 
 b=BPvJ0/5aVN8OK8iX260c5DZwGFhhf28zkiriwV1TaeU84fOG8RrLzc6ZA/zqzGtWALi5A0qEPQ8AHKq9GGVlaOR825j96EV9HZacf3UUWfElOkNbuiKx6td47N7BjQT9RDeh1VC9Zk3ssnXTFifxbR5bmBIqo+P8guWaZC98mbo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723493846; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=RssbRFWVdYwnPLzi6GIn27T9Y1lbXl7o9x32vtJ+4f8=;
 b=XCgtS0qMWUMAj8kYTV/yb0muxCoTruh2xdfMxGbj3IJDmjtouMKd5F7fQsVu1ioK
 azCZ57DfcNDqQFqMz5IevJel+EuLJj8csURIQ4DrkKFHiDYAfCbykgXGEjFogGldTJH
 yr8C6pPlr4oIx6NjpCjLTZ7DwksMf37zBjd+ndt8=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1723493844407751.8645407577515;
 Mon, 12 Aug 2024 13:17:24 -0700 (PDT)
Date: Mon, 12 Aug 2024 17:17:24 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <191483d05a3.129198f97500814.8001634600010504645@collabora.com>
In-Reply-To: <20240812112030.81774-1-vignesh.raman@collabora.com>
References: <20240812112030.81774-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v1] drm/ci: enable lockdep detection
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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


Hi Vignesh,

Thanks for your patch.


---- On Mon, 12 Aug 2024 08:20:28 -0300 Vignesh Raman  wrote ---

 > We have enabled PROVE_LOCKING (which enables LOCKDEP) in drm-ci. 
 > This will output warnings when kernel locking errors are encountered 
 > and will continue executing tests. To detect if lockdep has been 
 > triggered, check the debug_locks value in /proc/lockdep_stats after 
 > the tests have run. When debug_locks is 0, it indicates that lockdep 
 > has detected issues and turned itself off. So check this value and 
 > exit with an error if lockdep is detected. 

Should we exit with an error? Or with a warning? (GitLab-CI supports that).
Well, I guess it is serious enough.

Should we also track on the xfail folder? So we can annotate those errors as well?
Did you have an entire pipeline with this? To see if everything is still green?

Helen

 >  
 > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com> 
 > --- 
 >  
 > v1: 
 >  - Pipeline link to show lockdep_stats before and after tests, 
 >  https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1246721 
 >  
 > --- 
 >  drivers/gpu/drm/ci/igt_runner.sh | 11 +++++++++++ 
 >  1 file changed, 11 insertions(+) 
 >  
 > diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh 
 > index f38836ec837c..d2c043cd8c6a 100755 
 > --- a/drivers/gpu/drm/ci/igt_runner.sh 
 > +++ b/drivers/gpu/drm/ci/igt_runner.sh 
 > @@ -85,6 +85,17 @@ deqp-runner junit \ 
 >  --limit 50 \ 
 >  --template "See https://$CI_PROJECT_ROOT_NAMESPACE.pages.freedesktop.org/-/$CI_PROJECT_NAME/-/jobs/$CI_JOB_ID/artifacts/results/{{testcase}}.xml" 
 >  
 > +# Check if /proc/lockdep_stats exists 
 > +if [ -f /proc/lockdep_stats ]; then 
 > +    # If debug_locks is 0, it indicates lockdep is detected and it turns itself off. 
 > +    debug_locks=$(grep 'debug_locks:' /proc/lockdep_stats | awk '{print $2}') 
 > +    if [ "$debug_locks" -eq 0 ]; then 
 > +        echo "LOCKDEP issue detected. Please check dmesg logs for more information." 
 > +        cat /proc/lockdep_stats 
 > +        ret=1 
 > +    fi 
 > +fi 
 > + 
 >  # Store the results also in the simpler format used by the runner in ChromeOS CI 
 >  #sed -r 's/(dmesg-warn|pass)/success/g' /results/results.txt > /results/results_simple.txt 
 >  
 > -- 
 > 2.43.0 
 >  
 > 
