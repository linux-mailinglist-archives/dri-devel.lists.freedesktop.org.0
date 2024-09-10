Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D357D9736FB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 14:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A327010E0F4;
	Tue, 10 Sep 2024 12:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SYep+9hx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FF210E0F4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 12:18:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-374ba74e9b6so4249891f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 05:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725970683; x=1726575483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KugkAEyeLdA+Lr1FiytQVKVDKBMQyV+Baae1SliohwY=;
 b=SYep+9hxWfZuo/pCAerO64/c5cAM/RxPrOYdWwy6Si7JlpCCrw2aViHmZeXBPjPQI6
 Q//Q3hOuaOx+n16aTexDR+d6hJmQZbX955XMLZVdWIEqe7794d2+SMdrOiNftmnGUzam
 9unpZgBLxPuqAMQrB0Z7KHASDRLsthCqAq0st08LQw4C3yXIlQIhJiWjt3zql7Nbmidv
 gRhGuoPMO1UAivjATwngdcsZLjv1nKtpKl7aLHvA8UAHIizCdq02Eq5Cw3tAMpigQ+6w
 mTv/KPs65XfSzkilavnDnqixb8yQTQulgHAcT+BA5SRSV4lqiyhuFAy1SDB+zb3N/O6c
 942Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725970683; x=1726575483;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KugkAEyeLdA+Lr1FiytQVKVDKBMQyV+Baae1SliohwY=;
 b=EoPV5A+JNLd98iYt9ZzbsnRRJEUJtim/i8FljpQ/bSM41ubHJ9J4Qk28kRoeYebfgi
 Q7lFVzDd/fgYnS83azC5yYtEsBmPFt3K7DzHA/Nd/rJWSY3BQeHHU1WgUWGT/TsGE3vL
 rMStKHJv0YDE1fEBbLd7xtFE8CSdrosIt1HxJCrxgEOC+bSXupHK4b1zwG4CO2v1Kk+t
 woc68u8txVKvTV7XYhbstpToz0OlBP8pvnbZ+opdvCP6kTI9aA1xMmEFkPDr04HpOU2/
 FvR7w6HIPLEU24nJD4fjo9pLq8DUyjqQTq01DeyTkn8AB6va/Sx6bXjM6GsjjtrP5a0y
 lp/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD/Xl0DYgmTzjP2tVtuoqSDbJLqXsJ9E66Y0NYpvwq9iMjNnxQfiUjCRRu3lLmcDbbhsSMjO4JIhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMRpN5EV7QKDzcAaKfxxecrbhFoilh5RmR2Kq4wD19J/1phlPy
 s7qkME0e5EoXy1jKhDVxMv0h0Y+6I8v4DZ6uedIU7JqkSGgx3SFRsoQj7p7Ad0w=
X-Google-Smtp-Source: AGHT+IGQ7ot/qzITjqZiQ2yQTX8cSP8X6UTUmEUAWXrgqDhtwyevHVwQierW9aUdbXKZ+T5z1cacOw==
X-Received: by 2002:adf:f701:0:b0:374:c1de:5511 with SMTP id
 ffacd0b85a97d-3789229d6a0mr8698626f8f.3.1725970683283; 
 Tue, 10 Sep 2024 05:18:03 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3789564b02asm8865508f8f.4.2024.09.10.05.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:18:02 -0700 (PDT)
Message-ID: <60b71135-c4c8-47a8-ba67-e9365fa64c43@linaro.org>
Date: Tue, 10 Sep 2024 13:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: Add support for multiple PD from one
 process
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20240808104228.839629-1-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240808104228.839629-1-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Thanks Ekansh for the patch,

On 08/08/2024 11:42, Ekansh Gupta wrote:
> Memory intensive applications(which requires more tha 4GB) that wants
> to offload tasks to DSP might have to split the tasks to multiple
> user PD to make the resources available.
> 
> For every call to DSP, fastrpc driver passes the process tgid which
> works as an identifier for the DSP to enqueue the tasks to specific PD.
> With current design, if any process opens device node more than once
> and makes PD init request, same tgid will be passed to DSP which will
> be considered a bad request and this will result in failure as the same
> identifier cannot be used for multiple DSP PD.
> 
> Assign and pass a client ID to DSP which would be assigned during device
> open and will be dependent on the index of session allocated for the PD.
> This will allow the same process to open the device more than once and
> spawn multiple dynamic PD for ease of processing.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>    - Reformatted commit text.
>    - Moved from ida to idr.
>    - Changed dsp_pgid data type.
>    - Resolved memory leak.
> Changes in v3:
>    - Modified commit text.
>    - Removed idr implementation.
>    - Using session index for client id.
> 
>   drivers/misc/fastrpc.c | 30 ++++++++++++++++--------------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a7a2bcedb37e..0ce1eedcb2c3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -38,6 +38,7 @@
>   #define FASTRPC_INIT_HANDLE	1
>   #define FASTRPC_DSP_UTILITIES_HANDLE	2
>   #define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CLIENTID_MASK (16)

MASK normally is a hex mask rather than integer.

Looking at the actual code changes this looks like a flag rather than a 
mask. This is setting up bit 5 of the process group id in struct 
fastrpc_msg and other structs.

This really needs some documentation of how the group id is partitioned 
to have these various fields.

Something like:

/* FastRPC Group ID fields*/
#define FASTRPC_GID_SESSION_ID_MASK GENMASK(3, 0)
#define FASTRPC_GID_CLIENT_ID_MASK GENMASK(4, 4)


>   #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>   #define INIT_FILE_NAMELEN_MAX (128)
>   #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -298,7 +299,7 @@ struct fastrpc_user {
>   	struct fastrpc_session_ctx *sctx;
>   	struct fastrpc_buf *init_mem;
>   
> -	int tgid;
> +	int client_id;

Can you we rename this as groupid, this clearly reflects the facts that 
group id has multiple things as described above.

If group id is not the correct name instead it should be client_id, then 
this should also be reflected in various sturcts that have group id as 
tgid, pid, pgid an so.. that is another cleanup which should go as new 
patch.



--srini

>   	int pd;
>   	bool is_secure_dev;
>   	/* Lock for lists */
> @@ -613,7 +614,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>   	ctx->sc = sc;
>   	ctx->retval = -1;
>   	ctx->pid = current->pid;
> -	ctx->tgid = user->tgid;
> +	ctx->tgid = user->client_id;
>   	ctx->cctx = cctx;
>   	init_completion(&ctx->work);
>   	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
> @@ -1111,7 +1112,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>   	int ret;
>   
>   	cctx = fl->cctx;
> -	msg->pid = fl->tgid;
> +	msg->pid = fl->client_id;
>   	msg->tid = current->pid;
>   
>   	if (kernel)
> @@ -1294,7 +1295,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   		}
>   	}
>   
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->client_id;
>   	inbuf.namelen = init.namelen;
>   	inbuf.pageslen = 0;
>   	fl->pd = USER_PD;
> @@ -1396,7 +1397,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   		goto err;
>   	}
>   
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->client_id;
>   	inbuf.namelen = strlen(current->comm) + 1;
>   	inbuf.filelen = init.filelen;
>   	inbuf.pageslen = 1;
> @@ -1470,8 +1471,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   }
>   
>   static struct fastrpc_session_ctx *fastrpc_session_alloc(
> -					struct fastrpc_channel_ctx *cctx)
> +					struct fastrpc_user *fl)
>   {
> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>   	struct fastrpc_session_ctx *session = NULL;
>   	unsigned long flags;
>   	int i;
> @@ -1481,6 +1483,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
>   		if (!cctx->session[i].used && cctx->session[i].valid) {
>   			cctx->session[i].used = true;
>   			session = &cctx->session[i];
> +			fl->client_id = FASTRPC_CLIENTID_MASK | i;
>   			break;
>   		}
>   	}
> @@ -1505,7 +1508,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>   	int tgid = 0;
>   	u32 sc;
>   
> -	tgid = fl->tgid;
> +	tgid = fl->client_id;
>   	args[0].ptr = (u64)(uintptr_t) &tgid;
>   	args[0].length = sizeof(tgid);
>   	args[0].fd = -1;
> @@ -1580,11 +1583,10 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>   	INIT_LIST_HEAD(&fl->maps);
>   	INIT_LIST_HEAD(&fl->mmaps);
>   	INIT_LIST_HEAD(&fl->user);
> -	fl->tgid = current->tgid;
>   	fl->cctx = cctx;
>   	fl->is_secure_dev = fdevice->secure;
>   
> -	fl->sctx = fastrpc_session_alloc(cctx);
> +	fl->sctx = fastrpc_session_alloc(fl);
>   	if (!fl->sctx) {
>   		dev_err(&cctx->rpdev->dev, "No session available\n");
>   		mutex_destroy(&fl->mutex);
> @@ -1648,7 +1650,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>   static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>   {
>   	struct fastrpc_invoke_args args[1];
> -	int tgid = fl->tgid;
> +	int tgid = fl->client_id;
>   	u32 sc;
>   
>   	args[0].ptr = (u64)(uintptr_t) &tgid;
> @@ -1804,7 +1806,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>   	int err;
>   	u32 sc;
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.size = buf->size;
>   	req_msg.vaddr = buf->raddr;
>   
> @@ -1890,7 +1892,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>   		return err;
>   	}
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.flags = req.flags;
>   	req_msg.vaddr = req.vaddrin;
>   	req_msg.num = sizeof(pages);
> @@ -1980,7 +1982,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>   		return -EINVAL;
>   	}
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.len = map->len;
>   	req_msg.vaddrin = map->raddr;
>   	req_msg.fd = map->fd;
> @@ -2033,7 +2035,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>   		return err;
>   	}
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.fd = req.fd;
>   	req_msg.offset = req.offset;
>   	req_msg.vaddrin = req.vaddrin;
