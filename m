Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A50C48EBD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 20:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FF010E06D;
	Mon, 10 Nov 2025 19:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81D610E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 19:13:05 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay02.hostedemail.com (Postfix) with ESMTP id 93E52139F71;
 Mon, 10 Nov 2025 19:13:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf01.hostedemail.com (Postfix) with ESMTPA id 8E96560009; 
 Mon, 10 Nov 2025 19:12:20 +0000 (UTC)
Date: Mon, 10 Nov 2025 14:12:28 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Matthew Brost <matthew.brost@intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Calvin Owens <calvin@wbinvd.org>, Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Karan Tilak Kumar
 <kartilak@cisco.com>, Casey Schaufler <casey@schaufler-ca.com>, Petr Mladek
 <pmladek@suse.com>, Max Kellermann <max.kellermann@ionos.com>, Takashi Iwai
 <tiwai@suse.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Oltean
 <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner
 <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela
 <sebaddel@cisco.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov
 <idryomov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: Re: [PATCH v1 23/23] tracing: Switch to use %ptSp
Message-ID: <20251110141228.3f91d9a7@gandalf.local.home>
In-Reply-To: <20251110184727.666591-24-andriy.shevchenko@linux.intel.com>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-24-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8E96560009
X-Stat-Signature: 5hi1hakohzsg8hn7n1iyodmbff6458bx
X-Spam-Status: No, score=1.40
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/1YrbZuC0QyunYMMdAkDIH9kIv38TXqEA=
X-HE-Tag: 1762801940-392122
X-HE-Meta: U2FsdGVkX1/BylAg4AKkX/T62VAai09Fwoml7NNoYheN1mcYKcRGTBSABLgOYxDBmZc3QXGw435NWRW1fm6j26IoZJclHSgat1CYtqifdgYizQSiwftLFhR3KIWkHQZvWjzyXLg2mc0Q3PcpPlmly9wdl81xZUnfgj6L460ZoglHnyWOhH4JCMlOWSZwOcmlpyYl23ptJhBgBsvpLR2Kx8Ll9VVqHi6WIJKGvEKEkx6ilvffX6p0Md+SqUXFIyHv2WyDFgTArKQogLnmdfsVyUsJ0uOL4cbXthMvjI+fNrmir9/oaclf5f3+GPufx6UoMsebdMhlI3Sr4FpPoQrK6K880hi143pnEp1yWy8fDYta7ZhDYpeLLlRXJu8Dj1z7txbS6MErRzmgbJiDnG8EIQ==
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

On Mon, 10 Nov 2025 19:40:42 +0100
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  kernel/trace/trace_output.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
