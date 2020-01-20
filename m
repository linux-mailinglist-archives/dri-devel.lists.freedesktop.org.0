Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32944143843
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 09:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2A96EBDA;
	Tue, 21 Jan 2020 08:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5206A89231
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 18:35:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id DAB15291184
Message-ID: <f8fe1abba0973df57c092d23f95178e5aca33471.camel@collabora.com>
Subject: Re: [PATCH libdrm 1/2] modetest: Fix segmentation fault
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 20 Jan 2020 15:35:48 -0300
In-Reply-To: <20190722160823.26668-1-ezequiel@collabora.com>
References: <20190722160823.26668-1-ezequiel@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jan 2020 08:32:00 +0000
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
Cc: rohan.garg@collabora.com, Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

Any feedback here?

At least this one should be pretty straightforward
to merge, so I'm not sure it deserves a 6-month delay.

If anyone can take a look, I'd appreciate it.

Thanks!
Ezequiel

On Mon, 2019-07-22 at 13:08 -0300, Ezequiel Garcia wrote:
> When a mode is set with just a connector "-s foo",
> we get a nasty segmentation fault. Fix it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  tests/modetest/modetest.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> index e66be6607e00..5e628127a130 100644
> --- a/tests/modetest/modetest.c
> +++ b/tests/modetest/modetest.c
> @@ -1695,6 +1695,8 @@ static int parse_connector(struct pipe_arg *pipe, const char *arg)
>  		return -1;
>  
>  	/* Parse the remaining parameters. */
> +	if (!endp)
> +		return -1;
>  	if (*endp == '@') {
>  		arg = endp + 1;
>  		pipe->crtc_id = strtoul(arg, &endp, 10);


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
