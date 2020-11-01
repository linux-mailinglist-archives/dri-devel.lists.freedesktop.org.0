Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C72A1EB0
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 15:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFBA6E1BB;
	Sun,  1 Nov 2020 14:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C6C6E1BB
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 14:45:18 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j30so14054425lfp.4
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 06:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=nfSTOQa1GHPu7yZflmElx1yrigDoZA+beTbfSTxADDQ=;
 b=LNCbyfl80w5m5vmdw3f6tkQFZPsqsLTQxD7B0YQ9lQsp91AmlP1vbAFBWNx1lZpLAd
 P38k7TmgrN7uaqeRam6cxqBfIwjYYLqYjvGGuwvZOqwRdmzY9yEqvtyWbHNwRtZNQ9vg
 MuVynxEAfEH9OIJ0IwgQTMEP9jtxTsxGwPF6tHrg4ERcckfqZGAgvFJ6TZP9o2+cIGDi
 fdUdmmpX5MwYo8Qy+YuyNywQgXTUSAFuARSWrtAYrm1zpbva063byVj2nxUXXovDzt8u
 xL7T3BWrj5oXGEBJdmPgkwsMNh1Zv8hRvSh9OdWVNAO9IELnHdrPWxk2Ax3Rl6A3VLf7
 JBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=nfSTOQa1GHPu7yZflmElx1yrigDoZA+beTbfSTxADDQ=;
 b=DceS/RWdYfZghUS05RZ+KaBNytyG6c3ax+ct35l2rNqzJ3IZQ5kSzQsSAiEMn66fgs
 SZFcsSI7hWCmRoVp+8uTWcVnBD/jGKHCwZcxWWqgpOURqlcjxODV7AXjymIzwF/E3FLx
 9IaaZhJZCy6MniVHE7T29hSiz/vQqgAYTOCXGy44CaVRzzipqpqLYha5QoDn3DlJ7shK
 YXRYvf4YxOFOsRKMXTwfteUeHP4DM3Tc2U3N8WmySSPmHPZlrkaxiOYmnFQ3bGuEiVFr
 6Y/t6iQUWjz6cmljlT/bv5iO0MKPnGmXw21nsLey1fx0td25q+ljCb6GYOa4ddlDpG/7
 aMFA==
X-Gm-Message-State: AOAM5334Aqlj8tHJz48vOFrLY2+3ezViReB+xRCOXaFLnFeJH7D3+FSb
 uYuNCxhGP0JVcxdnECEbFdf6XEADcMLovWU3zAE=
X-Google-Smtp-Source: ABdhPJyBkgiSrqXhZk/gcQpWF+e/o3AVHRSwjg0BQJhL/gY5tJ65y2vrH74G0ZFq651tDjCK4YjMxaHGxd8OKMjGS5w=
X-Received: by 2002:a05:6512:322d:: with SMTP id
 f13mr3971359lfe.571.1604241916924; 
 Sun, 01 Nov 2020 06:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-52-digetx@gmail.com>
In-Reply-To: <20201025221735.3062-52-digetx@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Sun, 1 Nov 2020 23:44:40 +0900
Message-ID: <CAGTfZH2rBaWKox9nKM=_Wz8k65FLt1R7D8xSOUxe7xAJ1A00hA@mail.gmail.com>
Subject: Re: [PATCH v6 51/52] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: Dmitry Osipenko <digetx@gmail.com>
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
Reply-To: cwchoi00@gmail.com
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Mon, Oct 26, 2020 at 7:22 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> This patch moves ACTMON driver away from generating OPP table by itself,
> transitioning it to use the table which comes from device-tree. This
> change breaks compatibility with older device-trees in order to bring
> support for the interconnect framework to the driver. This is a mandatory
> change which needs to be done in order to implement interconnect-based
> memory DVFS. Users of legacy device-trees will get a message telling that
> theirs DT needs to be upgraded. Now ACTMON issues memory bandwidth request
> using dev_pm_opp_set_bw(), instead of driving EMC clock rate directly.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 91 ++++++++++++++++---------------
>  1 file changed, 48 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 3f732ab53573..1b0b91a71886 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -19,6 +19,8 @@
>  #include <linux/reset.h>
>  #include <linux/workqueue.h>
>
> +#include <soc/tegra/fuse.h>
> +

This patch touches the OPP. Is it related to this change?

>  #include "governor.h"
>
>  #define ACTMON_GLB_STATUS                                      0x0
> @@ -155,6 +157,7 @@ struct tegra_devfreq_device {
>
>  struct tegra_devfreq {
>         struct devfreq          *devfreq;
> +       struct opp_table        *opp_table;
>
>         struct reset_control    *reset;
>         struct clk              *clock;
> @@ -612,34 +615,19 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
>  static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>                                 u32 flags)
>  {
> -       struct tegra_devfreq *tegra = dev_get_drvdata(dev);
> -       struct devfreq *devfreq = tegra->devfreq;
>         struct dev_pm_opp *opp;
> -       unsigned long rate;
> -       int err;
> +       int ret;
>
>         opp = devfreq_recommended_opp(dev, freq, flags);
>         if (IS_ERR(opp)) {
> -               dev_err(dev, "Failed to find opp for %lu Hz\n", *freq);
> +               dev_err(dev, "failed to find opp for %lu Hz\n", *freq);

You used the 'Failed to' format in almost every error case.
Don't need to change it.
(snip)

Best Regards,
Chanwoo Choi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
