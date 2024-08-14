Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642DC95216D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 19:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA5D10E4FD;
	Wed, 14 Aug 2024 17:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AzG2v7fe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DAD10E4FD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:42:00 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5a156557026so206099a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723657318; x=1724262118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GHFJfLmSl7hDHpeBcHsBE1RJeYUTTMq76jcJawykoQ=;
 b=AzG2v7feg82GQ1aUXgxGg+yEKddWwyikVn3bxRGZUtYDhWJoYFyp/wb0+wGtTyadEj
 GzLJbdiBpfSAVuC2n4VIFynL2cSWv6BeWyuw8IihVlprEiwiSekw1Mx74z3M+6sNKF+o
 H+Ki1gNyUjO64Gj/VmvY4QW99r7UQ090FH/ccKoDSW6fY5rfpaVqSB6e8hOysfV9CPLt
 Lke/OFMJNP1tVpolYsi+WUK12m2HpyOJgeLEj5hjzihcqyH/0ol5JGrh1cOWhh5A/e6W
 m+E6AgwmXxKTDep/SGgdZs3eU+OQymfgA00aZHAzJtyu3OhH/byIFOHYOcpSZoFK1546
 P4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723657318; x=1724262118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GHFJfLmSl7hDHpeBcHsBE1RJeYUTTMq76jcJawykoQ=;
 b=t7aBgj9DjsU4yYDJ5GUaQIPldvlSfPDmj8AOUNQVTGJ1x9AH3qYbIdsoiOJD4H2MFr
 /YY/BVEhCbhcd6hm/thhshnXAyMZSU4PBeOaKiAslXDLvHcmWo0KokpbqpUdPXIOP3RL
 VCTg77MatdJ6g0XnEhULAoBDDDLd7Upy/IduqF7mCwgc6ArrVpVxw3G5kGZa34byTrCP
 GA5+71rr82/Vj5XUkpPjvb6M5uTINmVp3q4uI0ymcxzKWZrr5SmgIwxFFN+ky9SPk2LE
 /vwzq0D33BKtnJlpKoumkHVPjqN2Xzzl30DTxfNqr4QVl/x9khmwXXHbK+0+blHI3zfD
 qrNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCzGZLe0rYm0OkIq6n0ZUOt1b5wZiDrogPb4kbKkduRUDY08lwvtR88578MAdRiJqkuDNOG8soLr3ceRB7F/XvLrMxnWOcYDF6aPbRITBd
X-Gm-Message-State: AOJu0YzrH0M9DoPg1bmidGiWo9NSaNmlE4SNh2/I77ajBOUwY2njIC67
 qMeeSRNe8vSWzYjQtpIi7cQuE4mr1vZhNVZ99eG0ttq8X2BvkS68/rimE07fbe/ufw+ck9RP2Im
 lNOP1+J+iEFw88U3tWXhWiXfiiTGkdQ==
X-Google-Smtp-Source: AGHT+IEEBaEigDciY+8GghIwBoWxGooe/tDLaGVJp8TQHtn7OfjIfJvfaA1SqLEmEze6UDKPQ9aLuoqpPpORdHHrScA=
X-Received: by 2002:a05:6402:13d3:b0:5a1:1:27a9 with SMTP id
 4fb4d7f45d1cf-5bea1c8010fmr3260195a12.18.1723657317901; Wed, 14 Aug 2024
 10:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240812112030.81774-1-vignesh.raman@collabora.com>
 <191483d05a3.129198f97500814.8001634600010504645@collabora.com>
 <0a3db7dc-4533-4111-bec9-35cc68e35d83@collabora.com>
 <1914d612d8e.f2d5101b916106.3138016556910118397@collabora.com>
 <42753719-9619-45f1-b76a-8ff8d19cec22@collabora.com>
In-Reply-To: <42753719-9619-45f1-b76a-8ff8d19cec22@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 14 Aug 2024 10:41:45 -0700
Message-ID: <CAF6AEGuWHER=k-xGad-aAtOfS10R55W37FcU45phNnJpOwFhWw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: enable lockdep detection
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 daniels <daniels@collabora.com>, airlied <airlied@gmail.com>,
 daniel <daniel@ffwll.ch>, 
 "guilherme.gallo" <guilherme.gallo@collabora.com>, 
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>, 
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 14, 2024 at 2:42=E2=80=AFAM Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> Hi Helen,
>
> On 14/08/24 01:44, Helen Mae Koike Fornazier wrote:
> >
> >
> >
> >
> > ---- On Tue, 13 Aug 2024 02:26:48 -0300 Vignesh Raman  wrote ---
> >
> >   > Hi Helen,
> >   >
> >   > On 13/08/24 01:47, Helen Mae Koike Fornazier wrote:
> >   > >
> >   > > Hi Vignesh,
> >   > >
> >   > > Thanks for your patch.
> >   > >
> >   > >
> >   > > ---- On Mon, 12 Aug 2024 08:20:28 -0300 Vignesh Raman  wrote ---
> >   > >
> >   > >   > We have enabled PROVE_LOCKING (which enables LOCKDEP) in drm-=
ci.
> >   > >   > This will output warnings when kernel locking errors are enco=
untered
> >   > >   > and will continue executing tests. To detect if lockdep has b=
een
> >   > >   > triggered, check the debug_locks value in /proc/lockdep_stats=
 after
> >   > >   > the tests have run. When debug_locks is 0, it indicates that =
lockdep
> >   > >   > has detected issues and turned itself off. So check this valu=
e and
> >   > >   > exit with an error if lockdep is detected.
> >   > >
> >   > > Should we exit with an error? Or with a warning? (GitLab-CI suppo=
rts that).
> >   > > Well, I guess it is serious enough.
> >   >
> >   > I think we can exit with an error since we check the status at the =
end
> >   > of the tests.
> >
> > I mean, we can exit with a specific error and configure this specific e=
rror in gitlab-ci to be a warning,
> > so the job will be yellow and not red.
> >
> > But maybe the lockdep issue should be a strong error.
>
> Yes agree. We can exit with an error for lockdep issue instead of a warni=
ng.

I think that is too strong, lockdep can warn about things which can
never happen in practice.  (We've never completely solved some of the
things that lockdep complains about in runpm vs shrinker reclaim.)

Surfacing it as a warning is fine.

BR,
-R

> >
> >   >
> >   > >
> >   > > Should we also track on the xfail folder? So we can annotate thos=
e errors as well?
> >   >
> >   > Do you mean reporting this error in expectation files?
> >
> > I wonder if there will be cases were we are getting this error and we s=
hould ignore it, so in the code
> > we should check the xfail files to see if we should exit with an error =
or ignore it.
> >
> > For instance, if we have a case where we are having this error, and it =
is flaky, we might want to add it
> > to the flakes file list.
> >
> > Maybe this is not the case, I'm just wondering.
>
>
> The tests are passing but log shows lockdep warning
> (https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/62177711).
>
> Moreover if the lockdep warning is emitted, lockdep will not continue to
> run and there is no need to check this warning for each tests.
> So added the check at the end of the tests.
>
> >
> >
> >   >
> >   > > Did you have an entire pipeline with this? To see if everything i=
s still green?
> >   >
> >   > Yes. https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/62177=
711
> >   >
> >   > This is a test branch in which I reverted a fix for the lockdep iss=
ue.
> >   > We see 'WARNING: bad unlock balance detected!' in logs and pipeline=
 is
> >   > still green.
> >
> > But with your patch, it would red right?
>
> Yes it would fail and the pipeline will be red.
>
> > With the current patch, is the pipeline still all green?
>
> With this current patch, it will fail.
> Pipeline link to show lockdep_stats before and after tests,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1246721
>
> Regards,
> Vignesh
>
> >
> > Regards,
> > Helen
> >
> >   >
> >   > Regards,
> >   > Vignesh
> >   >
> >   > >
> >   > > Helen
> >   > >
> >   > >   >
> >   > >   > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com>
> >   > >   > ---
> >   > >   >
> >   > >   > v1:
> >   > >   >  - Pipeline link to show lockdep_stats before and after tests=
,
> >   > >   > https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines=
/1246721
> >   > >   >
> >   > >   > ---
> >   > >   >  drivers/gpu/drm/ci/igt_runner.sh | 11 +++++++++++
> >   > >   >  1 file changed, 11 insertions(+)
> >   > >   >
> >   > >   > diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/d=
rm/ci/igt_runner.sh
> >   > >   > index f38836ec837c..d2c043cd8c6a 100755
> >   > >   > --- a/drivers/gpu/drm/ci/igt_runner.sh
> >   > >   > +++ b/drivers/gpu/drm/ci/igt_runner.sh
> >   > >   > @@ -85,6 +85,17 @@ deqp-runner junit \
> >   > >   >  --limit 50 \
> >   > >   >  --template "See https://$CI_PROJECT_ROOT_NAMESPACE.pages.fre=
edesktop.org/-/$CI_PROJECT_NAME/-/jobs/$CI_JOB_ID/artifacts/results/{{testc=
ase}}.xml"
> >   > >   >
> >   > >   > +# Check if /proc/lockdep_stats exists
> >   > >   > +if [ -f /proc/lockdep_stats ]; then
> >   > >   > +    # If debug_locks is 0, it indicates lockdep is detected =
and it turns itself off.
> >   > >   > +    debug_locks=3D$(grep 'debug_locks:' /proc/lockdep_stats =
| awk '{print $2}')
> >   > >   > +    if [ "$debug_locks" -eq 0 ]; then
> >   > >   > +        echo "LOCKDEP issue detected. Please check dmesg log=
s for more information."
> >   > >   > +        cat /proc/lockdep_stats
> >   > >   > +        ret=3D1
> >   > >   > +    fi
> >   > >   > +fi
> >   > >   > +
> >   > >   >  # Store the results also in the simpler format used by the r=
unner in ChromeOS CI
> >   > >   >  #sed -r 's/(dmesg-warn|pass)/success/g' /results/results.txt=
 > /results/results_simple.txt
> >   > >   >
> >   > >   > --
> >   > >   > 2.43.0
> >   > >   >
> >   > >   >
> >   >
