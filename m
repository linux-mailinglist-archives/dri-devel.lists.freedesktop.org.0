Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7112A97F1AD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 22:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C1A10E2A5;
	Mon, 23 Sep 2024 20:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=freemail.hu header.i=@freemail.hu header.b="qY1DL1nl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2024 20:25:57 UTC
Received: from smtp-out.freemail.hu (fmfe01.freemail.hu [46.107.16.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A3310E2A5;
 Mon, 23 Sep 2024 20:25:57 +0000 (UTC)
Received: from [192.168.0.16] (catv-178-48-208-49.catv.fixed.vodafone.hu
 [178.48.208.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.freemail.hu (Postfix) with ESMTPSA id 4XCDq658Pkz6b9;
 Mon, 23 Sep 2024 22:19:14 +0200 (CEST)
Message-ID: <114482fe-0d91-4742-8ea1-5eaef8254c45@freemail.hu>
Date: Mon, 23 Sep 2024 22:18:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/i2c: rename aux.c and aux.h to auxch.c and
 auxch.h
To: bskeggs@nvidia.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240603091558.35672-1-egyszeregy@freemail.hu>
Content-Language: hu
From: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>
In-Reply-To: <20240603091558.35672-1-egyszeregy@freemail.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1727122755; 
 s=20181004; d=freemail.hu;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 l=6727; bh=sJL9AOsUJH2ovHr5PYMU/rHzKoMeXVYsbJRkD0TaT5E=;
 b=qY1DL1nlKnhWn0mpbbrefaus7g0fXuyQgL10k8YLW7EoFYdwaqOeDl6O+oQvVNmk
 SvFiAJ5gdZeuP+2ZqTy3J1GOrOWP4HE77uQ4mJh9vyF3orZv2QtyIksudyXdHHiWwSS
 IV7i4YkfUElv4+pFlUQ+hMRRXAOiqU/RVo1xBF0MBe/XGM1dt2UOj96u6lDp/vR7KP4
 Tc7OCbj3h2I+07VEElEunHRpDFgZer+RV3SBLWBjiYBFtuUj3+iMnO/z36DlNJyHAj5
 fySgG1IiRjIheKlzc5H7ikpMRfchALaeD+t1ayA7CERE4zDvIcBse8S5Oxkxvg7zwIW
 Elv65cjloA==
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

2024. 06. 03. 11:15 keltezéssel, egyszeregy@freemail.hu írta:
> From: Benjamin Szőke <egyszeregy@freemail.hu>
> 
> The goal is to clean-up Linux repository from AUX file names, because
> the use of such file names is prohibited on other operating systems
> such as Windows, so the Linux repository cannot be cloned and
> edited on them.
> 
> Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild             | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c          | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => auxch.c} | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => auxch.h} | 0
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c           | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c         | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c         | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c             | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c           | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c         | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c         | 2 +-
>   11 files changed, 10 insertions(+), 10 deletions(-)
>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c => auxch.c} (99%)
>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h => auxch.h} (100%)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> index 819703913a00..2c551bdc9bc9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> @@ -25,7 +25,7 @@ nvkm-y += nvkm/subdev/i2c/busnv50.o
>   nvkm-y += nvkm/subdev/i2c/busgf119.o
>   nvkm-y += nvkm/subdev/i2c/bit.o
>   
> -nvkm-y += nvkm/subdev/i2c/aux.o
> +nvkm-y += nvkm/subdev/i2c/auxch.o
>   nvkm-y += nvkm/subdev/i2c/auxg94.o
>   nvkm-y += nvkm/subdev/i2c/auxgf119.o
>   nvkm-y += nvkm/subdev/i2c/auxgm200.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> index dd391809fef7..6c76e5e14b75 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> @@ -24,7 +24,7 @@
>   #define anx9805_pad(p) container_of((p), struct anx9805_pad, base)
>   #define anx9805_bus(p) container_of((p), struct anx9805_bus, base)
>   #define anx9805_aux(p) container_of((p), struct anx9805_aux, base)
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   
>   struct anx9805_pad {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c
> similarity index 99%
> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c
> index d063d0dc13c5..fafc634acbf6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.c
> @@ -24,7 +24,7 @@
>   
>   #include <linux/string_helpers.h>
>   
> -#include "aux.h"
> +#include "auxch.h"
>   #include "pad.h"
>   
>   static int
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.h
> similarity index 100%
> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h
> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxch.h
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> index 47068f6f9c55..854bb4b5fdb4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs <bskeggs@redhat.com>
>    */
>   #define g94_i2c_aux(p) container_of((p), struct g94_i2c_aux, base)
> -#include "aux.h"
> +#include "auxch.h"
>   
>   struct g94_i2c_aux {
>   	struct nvkm_i2c_aux base;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> index dab40cd8fe3a..c17d5647cb99 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> @@ -19,7 +19,7 @@
>    * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>    * OTHER DEALINGS IN THE SOFTWARE.
>    */
> -#include "aux.h"
> +#include "auxch.h"
>   
>   static const struct nvkm_i2c_aux_func
>   gf119_i2c_aux = {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> index 8bd1d442e465..3c5005e3b330 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs <bskeggs@redhat.com>
>    */
>   #define gm200_i2c_aux(p) container_of((p), struct gm200_i2c_aux, base)
> -#include "aux.h"
> +#include "auxch.h"
>   
>   struct gm200_i2c_aux {
>   	struct nvkm_i2c_aux base;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> index 976539de4220..ab86e11e7780 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "priv.h"
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   #include "pad.h"
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> index 5904bc5f2d2a..cc26cd677917 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "pad.h"
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   
>   void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> index 3bc4d0310076..1797c6c65979 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "pad.h"
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   
>   static const struct nvkm_i2c_pad_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> index 7d417f6a816e..5afc1bf8e798 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> @@ -22,7 +22,7 @@
>    * Authors: Ben Skeggs
>    */
>   #include "pad.h"
> -#include "aux.h"
> +#include "auxch.h"
>   #include "bus.h"
>   
>   static void

@Ben Skeggs
When it will be merged? Your hints was done and ready in this renaming patch.
