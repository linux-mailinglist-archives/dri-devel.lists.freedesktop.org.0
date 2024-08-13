Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77492950DB3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 22:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4DB10E1BB;
	Tue, 13 Aug 2024 20:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="DbfWurC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C79610E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 20:15:05 +0000 (UTC)
Delivered-To: vignesh.raman@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723580102; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HULptGR5j20hPGaLzDhIoTtIWH0nlBKdYElkBf4fY+Kwvk4/rU62ZfYd3KBrDLESUOi0Verp248jpJd8/IsS92hKGvA1AUvvMC+Q7PyHaw+W3uf6yzuKR2iMTkpqnL4t1nJ/+4u1bu0JILumHjNHCHPAc2NnGRHXZrJyOGiQuVw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723580102;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IeOYj1SLMjlv/NYJYDOZ0kl0VE5R0AfaadAakZ9zTsY=; 
 b=Z/31AnK0NfrviPLFfZQRIC8klghlCSCLRPIA4unukJVqwEe4Ep8VqsIh6zCx+iGnC/sENdxr4AwCyZBL0eUvUxREAYc0zmLBHExAAG4yaT091bcUMnGFt1jXC/feJP8rZkpf7uV7FmcNxURFjkMyZIKE1KGytZtpud08GIgmEQ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723580102; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IeOYj1SLMjlv/NYJYDOZ0kl0VE5R0AfaadAakZ9zTsY=;
 b=DbfWurC84oTaRNQCdEWJ0mYiIOUisPXFfN6jL9qLffIQ7YAkfcSdSo9ZMhlncZnI
 Pah3X14Ih7qMNlWBqKsplPVdQ3RHrQAZwWhGfeRHANdAM8aN+VTJNnqXjPJiETfqZEJ
 fz4yInY1MnDESeTsGYeMUVzTikI/25BK3HxKLNdE=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 172358010001113.42362087380593;
 Tue, 13 Aug 2024 13:15:00 -0700 (PDT)
Date: Tue, 13 Aug 2024 17:14:59 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1914d612d8e.f2d5101b916106.3138016556910118397@collabora.com>
In-Reply-To: <0a3db7dc-4533-4111-bec9-35cc68e35d83@collabora.com>
References: <20240812112030.81774-1-vignesh.raman@collabora.com>
 <191483d05a3.129198f97500814.8001634600010504645@collabora.com>
 <0a3db7dc-4533-4111-bec9-35cc68e35d83@collabora.com>
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





---- On Tue, 13 Aug 2024 02:26:48 -0300 Vignesh Raman  wrote ---

 > Hi Helen, 
 >  
 > On 13/08/24 01:47, Helen Mae Koike Fornazier wrote: 
 > > 
 > > Hi Vignesh, 
 > > 
 > > Thanks for your patch. 
 > > 
 > > 
 > > ---- On Mon, 12 Aug 2024 08:20:28 -0300 Vignesh Raman  wrote --- 
 > > 
 > >   > We have enabled PROVE_LOCKING (which enables LOCKDEP) in drm-ci. 
 > >   > This will output warnings when kernel locking errors are encountered 
 > >   > and will continue executing tests. To detect if lockdep has been 
 > >   > triggered, check the debug_locks value in /proc/lockdep_stats after 
 > >   > the tests have run. When debug_locks is 0, it indicates that lockdep 
 > >   > has detected issues and turned itself off. So check this value and 
 > >   > exit with an error if lockdep is detected. 
 > > 
 > > Should we exit with an error? Or with a warning? (GitLab-CI supports that). 
 > > Well, I guess it is serious enough. 
 >  
 > I think we can exit with an error since we check the status at the end 
 > of the tests. 

I mean, we can exit with a specific error and configure this specific error in gitlab-ci to be a warning,
so the job will be yellow and not red.

But maybe the lockdep issue should be a strong error.

 >  
 > > 
 > > Should we also track on the xfail folder? So we can annotate those errors as well? 
 >  
 > Do you mean reporting this error in expectation files? 

I wonder if there will be cases were we are getting this error and we should ignore it, so in the code
we should check the xfail files to see if we should exit with an error or ignore it.

For instance, if we have a case where we are having this error, and it is flaky, we might want to add it
to the flakes file list.

Maybe this is not the case, I'm just wondering.


 >  
 > > Did you have an entire pipeline with this? To see if everything is still green? 
 >  
 > Yes. https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/62177711 
 >  
 > This is a test branch in which I reverted a fix for the lockdep issue. 
 > We see 'WARNING: bad unlock balance detected!' in logs and pipeline is 
 > still green. 

But with your patch, it would red right?
With the current patch, is the pipeline still all green?

Regards,
Helen

 >  
 > Regards, 
 > Vignesh 
 >  
 > > 
 > > Helen 
 > > 
 > >   > 
 > >   > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com> 
 > >   > --- 
 > >   > 
 > >   > v1: 
 > >   >  - Pipeline link to show lockdep_stats before and after tests, 
 > >   > https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1246721 
 > >   > 
 > >   > --- 
 > >   >  drivers/gpu/drm/ci/igt_runner.sh | 11 +++++++++++ 
 > >   >  1 file changed, 11 insertions(+) 
 > >   > 
 > >   > diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh 
 > >   > index f38836ec837c..d2c043cd8c6a 100755 
 > >   > --- a/drivers/gpu/drm/ci/igt_runner.sh 
 > >   > +++ b/drivers/gpu/drm/ci/igt_runner.sh 
 > >   > @@ -85,6 +85,17 @@ deqp-runner junit \ 
 > >   >  --limit 50 \ 
 > >   >  --template "See https://$CI_PROJECT_ROOT_NAMESPACE.pages.freedesktop.org/-/$CI_PROJECT_NAME/-/jobs/$CI_JOB_ID/artifacts/results/{{testcase}}.xml" 
 > >   > 
 > >   > +# Check if /proc/lockdep_stats exists 
 > >   > +if [ -f /proc/lockdep_stats ]; then 
 > >   > +    # If debug_locks is 0, it indicates lockdep is detected and it turns itself off. 
 > >   > +    debug_locks=$(grep 'debug_locks:' /proc/lockdep_stats | awk '{print $2}') 
 > >   > +    if [ "$debug_locks" -eq 0 ]; then 
 > >   > +        echo "LOCKDEP issue detected. Please check dmesg logs for more information." 
 > >   > +        cat /proc/lockdep_stats 
 > >   > +        ret=1 
 > >   > +    fi 
 > >   > +fi 
 > >   > + 
 > >   >  # Store the results also in the simpler format used by the runner in ChromeOS CI 
 > >   >  #sed -r 's/(dmesg-warn|pass)/success/g' /results/results.txt > /results/results_simple.txt 
 > >   > 
 > >   > -- 
 > >   > 2.43.0 
 > >   > 
 > >   > 
 > 
