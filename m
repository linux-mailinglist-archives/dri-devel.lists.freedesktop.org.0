Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FEAM5f+eGmOuQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 19:06:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356F498C5C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 19:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591AB10E5AA;
	Tue, 27 Jan 2026 18:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="LCk/JzdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318A710E5B5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1769537149; x=1770141949; i=deller@gmx.de;
 bh=c9+TE6dcyyx4nqnkMujsaoiGI5cjwNNmz6zLgFoXjfg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LCk/JzdKGdfhncq/d/LJdRM+5wWKUdWqgOgSUDeoHcktqV3B815bSV9gTG4TpkZS
 u4o8PQ2bR8hFLCRediqCEg9q53jkS00Iey484JtLJuYWHVQGZMTLVsR1DezWx1iar
 lpEoJrDbNKnhOCPQKfUWMVAimKt3xh1UxFCoyxD37xZJBu50OBQBEr9lhAtryouh3
 uujtqNIg1PzI1NuGAkiny7bDr4YzKWRLI8HJS8AriGhRrfv0na7Rg21AoG6raEVzh
 GuaU99VBF8PpZADkwMbmBAbkzdqhwUfLP7DS9xQvBpl0FiVLI0DcSvDCyhVUTHMTZ
 pWghxAnxZRYc26jrrw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.214]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQIv-1w8WfS2LIN-00pa5V; Tue, 27
 Jan 2026 19:05:49 +0100
Message-ID: <e95d2966-6136-489b-a48f-ea22f3cd2128@gmx.de>
Date: Tue, 27 Jan 2026 19:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] printk, vt, fbcon: Remove console_conditional_schedule()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jiri Slaby <jirislaby@kernel.org>, Simona Vetter <simona@ffwll.ch>
References: <20260126180836.SNCdMW2f@linutronix.de>
 <2026012757-voting-griminess-ca35@gregkh>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <2026012757-voting-griminess-ca35@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4wkG4956p91V+HwMdCRCw5jzDauN8WA2Ip3mD8Dah5de+Gu96b4
 b+Mr8zrfhWwx+mqHrwsrCP7lgdjpfHHh0sy88SXhGpD81vv8fiKkjfvv9O04w7PdObG9fts
 XPZnvRzBhzfawYWFdA2UqcE0azgC38xcmDozEP/E40mZQ+7s0XX8DjNXb6bibhxYJz4Puzh
 eWb9o+L2eDECVoXl94kSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:77nJz+km1Oo=;AOKjUOmox6V+2+lgg0O+2PH5W28
 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
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:bigeasy@linutronix.de,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:pmladek@suse.com,m:rostedt@goodmis.org,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:jirislaby@kernel.org,m:simona@ffwll.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gmx.de:dkim,gmx.de:mid,linutronix.de:email,lists.freedesktop.org:email,ffwll.ch:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 356F498C5C
X-Rspamd-Action: no action

On 1/27/26 15:24, Greg Kroah-Hartman wrote:
> On Mon, Jan 26, 2026 at 07:08:36PM +0100, Sebastian Andrzej Siewior wrot=
e:
>> do_con_write(), fbcon_redraw.*() invoke console_conditional_schedule()
>> which is a conditional scheduling point based on printk's internal
>> variables console_may_schedule. It may only be used if the console lock
>> is acquired for instance via console_lock() or console_trylock().
>>
>> Prinkt sets the internal variable to 1 (and allows to schedule)
>> if the console lock has been acquired via console_lock(). The trylock
>> does not allow it.
>>
>> The console_conditional_schedule() invocation in do_con_write() is
>> invoked shortly before console_unlock().
>> The console_conditional_schedule() invocation in fbcon_redraw.*()
>> original from fbcon_scroll() / vt's con_scroll() which originate from a
>> line feed.
>>
>> In console_unlock() the variable is set to 0 (forbids to schedule) and
>> it tries to schedule while making progress printing. This is brand new
>> compared to when console_conditional_schedule() was added in v2.4.9.11.
>>
>> In v2.6.38-rc3, console_unlock() (started its existence) iterated over
>> all consoles and flushed them with disabled interrupts. A scheduling
>> attempt here was not possible, it relied that a long print scheduled
>> before console_unlock().
>>
>> Since commit 8d91f8b15361d ("printk: do cond_resched() between lines
>> while outputting to consoles"), which appeared in v4.5-rc1,
>> console_unlock() attempts to schedule if it was allowed to schedule
>> while during console_lock(). Each record is idealy one line so after
>> every line feed.
>>
>> This console_conditional_schedule() is also only relevant on
>> PREEMPT_NONE and PREEMPT_VOLUNTARY builds. In other configurations
>> cond_resched() becomes a nop and has no impact.
>>
>> I'm bringing this all up just proof that it is not required anymore. It
>> becomes a problem on a PREEMPT_RT build with debug code enabled because
>> that might_sleep() in cond_resched() remains and triggers a warnings.
>> This is due to
>>
>>   legacy_kthread_func-> console_flush_one_record ->  vt_console_print->=
 lf
>>     -> con_scroll -> fbcon_scroll
>>
>> and vt_console_print() acquires a spinlock_t which does not allow a
>> voluntary schedule. There is no need to fb_scroll() to schedule since
>> console_flush_one_record() attempts to schedule after each line.
>> !PREEMPT_RT is not affected because the legacy printing thread is only
>> enabled on PREEMPT_RT builds.
>>
>> Therefore I suggest to remove console_conditional_schedule().
>>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Fixes: 5f53ca3ff83b4 ("printk: Implement legacy printer kthread for PRE=
EMPT_RT")
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> ---
>>
>> A follow-up to
>> 	https://lore.kernel.org/all/20260114145955.d924Z-zu@linutronix.de/
>>
>>   drivers/tty/vt/vt.c              |  1 -
>>   drivers/video/fbdev/core/fbcon.c |  6 ------
>>   include/linux/console.h          |  1 -
>>   kernel/printk/printk.c           | 16 ----------------
>>   4 files changed, 24 deletions(-)
>>
>> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
>> [....]
>=20
> No objection from me about removing this if it's not needed anymore!
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I've added it to the fbdev git tree to get some testing....

Thanks!
Helge
