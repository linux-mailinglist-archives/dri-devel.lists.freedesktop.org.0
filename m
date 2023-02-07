Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51B68D14C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 09:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0663D10E466;
	Tue,  7 Feb 2023 08:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F3910E466
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 08:08:20 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230207080818epoutp0447707a8f9129e266c0b8c525521cab2f~BfGJU3MPw3232032320epoutp04Y
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 08:08:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230207080818epoutp0447707a8f9129e266c0b8c525521cab2f~BfGJU3MPw3232032320epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1675757298;
 bh=UqxfpwkbzyhrY+KnKPi/pFl1gk7Nlvdz1n/Y5b03ScY=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=V7sS9KnQmRcDeWMVA5+zrOWKao73UvPnJZYNCkYnrwoVTmB5tAfm+I0K6x3KDzn+L
 SWybUxrfhhzn7VlBGb2ruKgmrgYZQ35lREI0FmcEi9Cu3VdKnZSQ1O9oB5v3qLoD/2
 c7/f1XcheQcW1HJVASTk0Eb7o6QHCghoBek9oNwQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20230207080817epcas1p41e25e50015c3bb88411264e66b7a15b9~BfGIyYuYD1671116711epcas1p4o;
 Tue,  7 Feb 2023 08:08:17 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.136]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4P9wjr4lXSz4x9Q0; Tue,  7 Feb
 2023 08:08:16 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 33.57.37890.BE602E36; Tue,  7 Feb 2023 17:08:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20230207080811epcas1p4598d6616efa16351961891c0002dfdba~BfGC3o_d61131711317epcas1p4a;
 Tue,  7 Feb 2023 08:08:11 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230207080811epsmtrp2120c74791a5bce88ade2ed828a60824b~BfGC3EhES2398023980epsmtrp2g;
 Tue,  7 Feb 2023 08:08:11 +0000 (GMT)
X-AuditID: b6c32a38-39fff70000029402-9d-63e206eb0c7e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 CA.83.17995.BE602E36; Tue,  7 Feb 2023 17:08:11 +0900 (KST)
Received: from hoegeunkwon02 (unknown [10.113.111.147]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230207080811epsmtip264d9a24c111ed99a8b83c2f150d3a25b~BfGCsSFgu1513715137epsmtip2O;
 Tue,  7 Feb 2023 08:08:11 +0000 (GMT)
From: "Hoegeun Kwon" <hoegeun.kwon@samsung.com>
To: <dri-devel@lists.freedesktop.org>
In-Reply-To: <20230116094420.26075-1-hoegeun.kwon@samsung.com>
Subject: RE: [PATCH libdrm] vbltest: add option to use high pipe
Date: Tue, 7 Feb 2023 17:08:10 +0900
Message-ID: <003c01d93acb$51e69ba0$f5b3d2e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQE4VxhIgfZ4AssyFrb7IA0ZGbSchgHAB7vTr/bnzMA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7bCmru5rtkfJBvdvSVt8PFBsceXrezaL
 dY1XmB2YPRZs/MrksXZPA6vH/e7jTAHMUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6
 hpYW5koKeYm5qbZKLj4Bum6ZOUCLlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF
 pgV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGTPXXWUt+ChWMX1OP0sD40fBLkYODgkBE4nX04FM
 Lg4hgR2MEjeP3maCcD4xSjR9m8oI4XxmlPj4ZBFLFyMnWMfB9xeYQWwhgV2MEtfeQ7W/YZQ4
 tX86E0iCTUBfYs36c6wgK0QEVCVm/TQHCTML6EnseNQFVsIpYCfR9PE/K4gtLOAg0fX3AjuI
 zSKgIrHmVh9YDa+ApUTLqTlQtqDEyZlPWCDmyEtsfzuHGeIeBYmfT5eBzRERsJK4/uEtM0SN
 iMTszjZmkNskBN6yS5xfcAKqwUXi89VvULawxKvjW9ghbCmJz+/2skHY2RL3TlyHskskHpz8
 yQhhG0vsXzqZCeQvZgFNifW79CHCihI7f89lhNjLJ/Huaw8rJHR5JTrahCBK1CSeNRxghbBl
 JE71LmeawKg0C8lns5B8NgvJB7MQli1gZFnFKJZaUJybnlpsWGACj+rk/NxNjOAUqGWxg3Hu
 2w96hxiZOBgPMUpwMCuJ8JoeeJAsxJuSWFmVWpQfX1Sak1p8iNEUGNYTmaVEk/OBSTivJN7Q
 xNLAxMzI2MTC0MxQSZxX3PZkspBAemJJanZqakFqEUwfEwenVAOTnFjpqpgnXzc2HnM0uJfu
 p71mgse8uBczfmn/3mPklOY488TTecdWhm15s0bJ+FioSL6wRX04m1LD1PjP25WOxK++nvg4
 9Pvb49aHk6c5M+1L1Y4wLlUOSZ0qYfzr+pEG7kXWSfMkVqw/9WfBpJSzEbWHL4dvz03nzqzg
 X3bl3N6z5jzfOpUsTcUE2pcxnV37LDV59bYkhUojZ5HLy26Zlgqfv/ni/hyz6yutCyXDlDft
 nbeqcU6z9uKy8pb6464VnZW3e6bt29sxZct5L2UBLd+nfAK//m6bEFA88YDzaqttUzivBN6c
 ZGg6LyX5lrTww8gVmbPd1P8vNbyrPrcyXjFP2yBF+VHI3x9n3q0MUGIpzkg01GIuKk4EAHwT
 8DoKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSvO5rtkfJBk2z2S0+Hii2uPL1PZvF
 usYrzA7MHgs2fmXyWLungdXjfvdxpgDmKC6blNSczLLUIn27BK6MmeuushZ8FKuYPqefpYHx
 o2AXIyeHhICJxMH3F5i7GLk4hAR2MErcur2ZESIhI7GqfwtrFyMHkC0scfhwMUTNK0aJaRtO
 soHUsAnoS6xZfw6sRkRAVWLWT3MQk1nAQGLKf3GI8n5GiVcNrUwg5ZwCdhJNH/+zgtjCAg4S
 XX8vsIPYLAIqEmtu9YHV8ApYSrScmgNlC0qcnPmEBcRmFtCW6H3Yyghhy0tsfzuHGeJMBYmf
 T5eBzRQRsJK4/uEtM0SNiMTszjbmCYzCs5CMmoVk1Cwko2YhaVnAyLKKUTK1oDg3PbfYsMAo
 L7Vcrzgxt7g0L10vOT93EyM4HrS0djDuWfVB7xAjEwfjIUYJDmYlEV7TAw+ShXhTEiurUovy
 44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamDS2Gi17c2Njd4ul+tWbeO2
 fh9l/vn8AiMnl63nTZN3TFkr9FEt54t/2nWpxR8uLdSa6Xqo4ukVxlqdPzP4Hn4yu3k0x7sz
 p8PnsPQd4fKu7Vme3T2pOzsspgc0K7J4nD3KJj9p+08B70ObWG9I9P6ex72tXcFG9MJ6zvSr
 jDOY5WZdnPDoyRNh3rk6jo7zxX7VfVe+qnl4DYvllNWmbVfYn3G9nCq30rxVeMMl27ssrX8+
 7hdlNiitlHmU5yZnFffBsioy38Za+q2cijyfaI1/2KkESy6TWrmEqjSjaO11uqW1Sofmtd3o
 WWo9vfd8JD/H9OUJM05tty0v3bdK/H3QOZXpBV6H5x9fvC86dYYSS3FGoqEWc1FxIgAA+OeA
 9gIAAA==
X-CMS-MailID: 20230207080811epcas1p4598d6616efa16351961891c0002dfdba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230116094454epcas1p104533e1c24b32fb09f2500c8b42bb1ea
References: <CGME20230116094454epcas1p104533e1c24b32fb09f2500c8b42bb1ea@epcas1p1.samsung.com>
 <20230116094420.26075-1-hoegeun.kwon@samsung.com>
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
Cc: eric@engestrom.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Could you please check this patch.

Best regards
Hoegeun

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Hoegeun Kwon
> Sent: Monday, January 16, 2023 6:44 PM
> To: dri-devel@lists.freedesktop.org; hoegeun.kwon@samsung.com
> Subject: [PATCH libdrm] vbltest: add option to use high pipe
> 
> Add option to use high pipe.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  tests/vbltest/vbltest.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/vbltest/vbltest.c b/tests/vbltest/vbltest.c index
> 1c2b519eec4a..1be77b81c560 100644
> --- a/tests/vbltest/vbltest.c
> +++ b/tests/vbltest/vbltest.c
> @@ -45,10 +45,13 @@
> 
>  extern char *optarg;
>  extern int optind, opterr, optopt;
> -static char optstr[] = "D:M:s";
> +static char optstr[] = "D:M:p:s";
> 
>  int secondary = 0;
> 
> +#define DRM_VBLANK_HIGH_CRTC_SHIFT 1
> +static int high_pipe = 0;
> +
>  struct vbl_info {
>  	unsigned int vbl_count;
>  	struct timeval start;
> @@ -65,6 +68,8 @@ static void vblank_handler(int fd, unsigned int frame,
> unsigned int sec,
>  	vbl.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
>  	if (secondary)
>  		vbl.request.type |= DRM_VBLANK_SECONDARY;
> +	if (high_pipe)
> +		vbl.request.type |= high_pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
>  	vbl.request.sequence = 1;
>  	vbl.request.signal = (unsigned long)data;
> 
> @@ -90,6 +95,7 @@ static void usage(char *name)
>  	fprintf(stderr, "  -D DEVICE  open the given device\n");
>  	fprintf(stderr, "  -M MODULE  open the given module\n");
>  	fprintf(stderr, "  -s         use secondary pipe\n");
> +	fprintf(stderr, "  -p NUM     use high pipe\n");
>  	exit(0);
>  }
> 
> @@ -113,12 +119,18 @@ int main(int argc, char **argv)
>  		case 's':
>  			secondary = 1;
>  			break;
> +		case 'p':
> +			high_pipe = atoi(optarg);
> +			break;
>  		default:
>  			usage(argv[0]);
>  			break;
>  		}
>  	}
> 
> +	if (secondary && high_pipe)
> +		return 1;
> +
>  	fd = util_open(device, module);
>  	if (fd < 0)
>  		return 1;
> @@ -127,6 +139,8 @@ int main(int argc, char **argv)
>  	vbl.request.type = DRM_VBLANK_RELATIVE;
>  	if (secondary)
>  		vbl.request.type |= DRM_VBLANK_SECONDARY;
> +	if (high_pipe)
> +		vbl.request.type |= high_pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
>  	vbl.request.sequence = 0;
>  	ret = drmWaitVBlank(fd, &vbl);
>  	if (ret != 0) {
> @@ -143,6 +157,8 @@ int main(int argc, char **argv)
>  	vbl.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
>  	if (secondary)
>  		vbl.request.type |= DRM_VBLANK_SECONDARY;
> +	if (high_pipe)
> +		vbl.request.type |= high_pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
>  	vbl.request.sequence = 1;
>  	vbl.request.signal = (unsigned long)&handler_info;
>  	ret = drmWaitVBlank(fd, &vbl);
> --
> 2.17.1


