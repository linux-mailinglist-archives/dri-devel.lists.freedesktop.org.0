Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CED11536DD3
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 18:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141EC10E317;
	Sat, 28 May 2022 16:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sat, 28 May 2022 16:57:26 UTC
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41A010E317
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 16:57:26 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id 6DCAD2F1A9;
 Sat, 28 May 2022 16:52:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id CD3EC60011; 
 Sat, 28 May 2022 16:52:14 +0000 (UTC)
Message-ID: <d470331985c7d82c6e5bb6d548ab610479416761.camel@perches.com>
Subject: Re: [PATCH v3 4/4] drm/msm/adreno: Fix up formatting
From: Joe Perches <joe@perches.com>
To: Konrad Dybcio <konrad.dybcio@somainline.org>, 
 ~postmarketos/upstreaming@lists.sr.ht
Date: Sat, 28 May 2022 09:52:14 -0700
In-Reply-To: <20220528160353.157870-4-konrad.dybcio@somainline.org>
References: <20220528160353.157870-1-konrad.dybcio@somainline.org>
 <20220528160353.157870-4-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=1.40
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: CD3EC60011
X-Stat-Signature: hguqrzykifma4fuxzhcnc6wiq5pkkp7b
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19HTwQEza4v02RuQBSx/8pguy5mblJPov4=
X-HE-Tag: 1653756734-471035
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2022-05-28 at 18:03 +0200, Konrad Dybcio wrote:
> Leading spaces are not something checkpatch likes, and it says so when
> they are present. Use tabs consistently to indent function body and
> unwrap a 83-char-long line, as 100 is cool nowadays.

unassociated trivia:

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
[]
> @@ -199,7 +199,7 @@ static inline int adreno_is_a420(struct adreno_gpu *g=
pu)
> =20
>  static inline int adreno_is_a430(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 430;
> +	return gpu->revn =3D=3D 430;
>  }

looks like these could/should return bool

>  static inline int adreno_is_a506(struct adreno_gpu *gpu)
> @@ -239,7 +239,7 @@ static inline int adreno_is_a540(struct adreno_gpu *g=
pu)
> =20
>  static inline int adreno_is_a618(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn =3D=3D 618;
> +	return gpu->revn =3D=3D 618;
>  }

etc...
