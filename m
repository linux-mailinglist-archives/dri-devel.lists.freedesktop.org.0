Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F71144446
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 19:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F2B89BAB;
	Tue, 21 Jan 2020 18:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99C489BAB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 18:29:38 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id b4so2468883vsa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 10:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t42/af076FTYnTQqCeEzMAefnqlG8pmDXKGaC7/eBuI=;
 b=U2cSzZZNLcV8APaxobe1tJuenunsV++88ADmAPCsWn1srTjzmGw614AuZ0FsW9xNg4
 uDfKyPTfjAPNOmT4asj0fSVNo5sEv1kfNIgG9joFGzJe6UsEuXdlu6KVwcjNgn2kmayZ
 OlXahMvPx0Xf40J0L+8/IeS9t4Oe//P+dkr2kcBeDu8A/zc/3//f5LIpexYUfZzZoEue
 mkyh/mPGKivjfVsoI5W40U+Q+BiflYROS26GUAqqpNtr6A13vA6a0y4UQephwu9ISfM/
 4pQYrtbc6953m7BQDB74rEuxkVuYnJGe8KR9Kp1PfDqANMczq0oWrg8PTquGOQDRLZqA
 /FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t42/af076FTYnTQqCeEzMAefnqlG8pmDXKGaC7/eBuI=;
 b=tHQ9Jdrv9gYPAHdjN6vpPykUe6qAF5g1IQLingB5HjhJVZxFsgRhe16m27NsCSaaJ2
 zl2I0eXnWZM3ZOBdBXoBgIrSpJyYaM0Sw+d/hsK4Rb1N77vhZKz4/P28nOXO5MzChyRD
 NV5BUPcAfMpDcvPYlJlp3NRJWt3d0AUoT3T3Vr3kuZwhjtuIKlVX8NENv3UVTn/qylm5
 7CQuQ9ks1eXKZx/0j2ItIFmlIoMl8KPXwmiQ8Iqos4vLLZvtSGmbkdtaHD69e6KQDasW
 3VVGCpgBQV8KZsLpCFNyi9qTJV/MDEGiFJRntBmQAEukFDPIPI4NmanONMpPrYCEFP87
 t6tA==
X-Gm-Message-State: APjAAAXcFbXJOyeRCgIBG6A7WCpj/WjNfjs4LfXwYi8Eo7/SKOu/MEKV
 6h/7KAZRm8//RCvQah0UpkmQKjLNF+JOnnRZnwg=
X-Google-Smtp-Source: APXvYqyMQZzxyVtnyYFD2ewP1MTwNrME2W+KIHO52QfhObobqy85gDSU8w4TkHeqI0KafiV/97pOUpmRFYGZwTHXyI4=
X-Received: by 2002:a05:6102:7a4:: with SMTP id x4mr38421vsg.85.1579631377797; 
 Tue, 21 Jan 2020 10:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20190722160823.26668-1-ezequiel@collabora.com>
 <20190722160823.26668-2-ezequiel@collabora.com>
In-Reply-To: <20190722160823.26668-2-ezequiel@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 21 Jan 2020 18:30:21 +0000
Message-ID: <CACvgo53eDRHd-wQrt41UAfFzi_ZYUC2yXCRVx9ktrtiHB6_Q8g@mail.gmail.com>
Subject: Re: [PATCH libdrm 2/2] modetest: Add a new "-r" option to set a
 default mode
To: Ezequiel Garcia <ezequiel@collabora.com>
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
Cc: rohan.garg@collabora.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ezequiel,

The first patch looks spot on. I'll commit it in a moment.

On Mon, 22 Jul 2019 at 17:08, Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> This option finds the first connected connector and then
> sets its preferred mode on it.
>
> Set this option to be set when no mode or plane is set
> explicitily. This allows to quickly test, in cases where
> one just needs something displayed.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  tests/modetest/modetest.c | 81 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 75 insertions(+), 6 deletions(-)
>
> diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> index 5e628127a130..6042aaae7cca 100644
> --- a/tests/modetest/modetest.c
> +++ b/tests/modetest/modetest.c

> @@ -1874,6 +1878,9 @@ static int pipe_resolve_connectors(struct device *dev, struct pipe_arg *pipe)
>         char *endp;
>
>         for (i = 0; i < pipe->num_cons; i++) {
> +               /* If set_preferred is used, the connector is already resolved. */
> +               if (pipe->con_ids[i])
> +                       continue;
This seems rather non-intuitive. How about we guard invocation of this
function altogether?
For example (minimal whitespace changes), in main() we can use:

if (!set_preferred && pipe_resolve_connectors()....)


> +static int pipe_find_preferred(struct device *dev, struct pipe_arg *pipe)
> +{
> +       drmModeRes *res = dev->resources->res;
> +       drmModeConnector *con = NULL;
> +       char *con_str;
> +       int i;
> +
> +       for (i = 0; i < res->count_connectors; i++) {
> +               con = drmModeGetConnector(dev->fd, res->connectors[i]);
> +               if (con->connection == DRM_MODE_CONNECTED)
> +                       break;
> +               drmModeFreeConnector(con);
> +               con = NULL;
> +       }
> +

> +
> +       /* A CRTC possible will be chosen by pipe_find_crtc_and_mode. */
> +       pipe->crtc_id = (uint32_t)-1;
> +
As-is this will pick the first connector, which may not work with all crtcs.

How about we tweak the loop above to pick a connector for the given crtc_id?
Feel free to do that as follow-up.


>  int main(int argc, char **argv)

>         int test_cursor = 0;
> +       int set_preferred = 0;
>         int use_atomic = 0;
>         char *device = NULL;
>         char *module = NULL;
> @@ -1987,6 +2043,9 @@ int main(int argc, char **argv)
>                 case 'v':
>                         test_vsync = 1;
>                         break;
> +               case 'r':
> +                       set_preferred = 1;
> +                       break;
>                 case 'w':
>                         prop_args = realloc(prop_args,
>                                            (prop_count + 1) * sizeof *prop_args);
> @@ -2008,7 +2067,7 @@ int main(int argc, char **argv)
>         }
>
>         if (!args || (args == 1 && use_atomic))
> -               encoders = connectors = crtcs = planes = framebuffers = 1;
> +               set_preferred = encoders = connectors = crtcs = planes = framebuffers = 1;
>
Did you mean to git add this? The variable set_preferred is already
set as needed.

Any reason why using atomic modeset (modetest -r -a), clears the
screen while legacy (modetest -r) sets the usual pattern. What am I
missing?

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
