Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC255AA82A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 08:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A1E10E76F;
	Fri,  2 Sep 2022 06:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7874510E76F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 06:41:51 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id q7so1928882lfu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 23:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date; bh=aM7fbLISS/JS1kDbWDaZc8SQCVKZRt3F5AuWXVBW7CI=;
 b=UhBhueFq/hDdPmcd0cRzNcc1tkUMYEWLwddxaTUsAf8KoLlMKEE+lJ6PK3ZsqP+3vy
 UT2pkEzE8yfkUeaoXpw4dhFUw9r1vy0Dt4yMT5W4/JRx0VS/Y94REl+FoOcXxaPzGwgl
 VBzCnq/jgJBzPPSS1IL1303VB2g4/XuVj0y/yp5qAv46GrMPKLq9eYDJKqz3OyFdebzf
 i7UlsV1wpkBj9jV9ND5tZOPESglIwVtanvOUiZEEm9HFUclOsJ8YY+1IoYRRM0GpLp+s
 CgbsheaiKCivEYepN8pC/sFkH1xLnb+J7zfXt46LuC85NQbNbMbIY6jF5Vd91HOLWX6R
 FqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=aM7fbLISS/JS1kDbWDaZc8SQCVKZRt3F5AuWXVBW7CI=;
 b=uab0N6JSt7aCj7mNqW8htR73Wi5OViekYiesRp7eKtnQccVHByhM57FPKaJuMWa7gp
 XmOtXAjfR503FkQGP9Z9oMk1FMdZluRMU6sjVWXJOFIzIS1cF/K9IoQe8tF/c1vD1OSb
 x0ACE9yB9G0BB51MMye/ueMs09WwBafrEbWVhYxwdf4nACzRym+wpRPG2ovLPiU9+NhK
 JeKy9Z3kovF1hDLu9la8rfKHXGGfKvTqDeCm8hx88/j1BFVbXLn2y/rfZlTW8SSye8Zn
 sl7KnnnZQjV9AN0j0msUuYxZx9s4GF6ociDPXD+8yTFcIm/tEJ0OMaz2YXptysGl9Dfq
 Rlew==
X-Gm-Message-State: ACgBeo0JxAm0Gkh+tG9Vwz9BApkOsd49HwUhXdUolBeHdiRqJ/dmAUkR
 HAzO5BEDEzod664rw3oeAk0alg==
X-Google-Smtp-Source: AA6agR4oDArM78fHao9cOCzs2Mmc3xqHY0QoKUm9CMb0/9kQ5eNlBeOja25Tub+VGz8ZnoZVp+h0zQ==
X-Received: by 2002:ac2:4c54:0:b0:48c:9d53:80aa with SMTP id
 o20-20020ac24c54000000b0048c9d5380aamr10934355lfk.529.1662100909292; 
 Thu, 01 Sep 2022 23:41:49 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.228.19]) by smtp.gmail.com with ESMTPSA id
 t18-20020a056512209200b004946bec4e61sm144489lfr.140.2022.09.01.23.41.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Sep 2022 23:41:48 -0700 (PDT)
Date: Fri, 02 Sep 2022 09:40:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, dri-devel@lists.freedesktop.org
Subject: =?US-ASCII?Q?Re=3A_=5BRESEND_PATCH_libdrm_v3_2/2=5D_tests/mod?=
 =?US-ASCII?Q?etest=3A_Add_support_for_writeback_connector?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220901230924.145-3-quic_jesszhan@quicinc.com>
References: <20220901230924.145-1-quic_jesszhan@quicinc.com>
 <20220901230924.145-3-quic_jesszhan@quicinc.com>
Message-ID: <10B842D5-E61B-4D29-A0FD-CE65687734B5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: hoegsberg@google.com, Rohith Iyer <quic_rohiiyer@quicinc.com>,
 quic_abhinavk@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2 September 2022 02:09:24 GMT+03:00, Jessica Zhang <quic_jesszhan@quici=
nc=2Ecom> wrote:
>From: Rohith Iyer <quic_rohiiyer@quicinc=2Ecom>
>
>Add writeback support to modetest with the below options:
>
>- Passing in -c will now also show the writeback connector
>
>- Test a built-in mode on writeback connector
>
>- Test a custom mode from user input on writeback connector
>  Usage: "=2E/modetest -M msm -x <connector_id>:<mode_parameters>
>            -a -P <plane_id>@<crtc_id>:<widthxheight>+0+0@RG24=2E"
>  Refer to --help for exact syntax
>
>- Dump the writeback output buffer to bitstream
>  Usage: "=2E/modetest -M msm -s <connector_id>:<widthxheight>
>          -a -o <filepath>
>          -P <plane_id>@<crtc_id>:<widthxheight>+0+0@RG24"
>
>This currently supports a singular writeback connector=2E
>
>Changes made in V2:
>- Added helper method that checks if user pipe has writeback connector
>- Added error message for dump flag if no writeback connector is found
>- Polls on the writeback fence fd until writeback is complete
>
>Changes made in V3:
>- Resolved compiler warnings
>- Defined ETIME to ETIMEDOUT in cases where ETIME is undefined
>
>Co-developed-by: Rohith Iyer <quic_rohiiyer@quicinc=2Ecom>
>Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc=2Ecom>
>---
> tests/modetest/buffers=2Ec  |  19 ++++
> tests/modetest/buffers=2Eh  |   1 +
> tests/modetest/modetest=2Ec | 183 ++++++++++++++++++++++++++++++++++----
> 3 files changed, 184 insertions(+), 19 deletions(-)
>
>diff --git a/tests/modetest/buffers=2Ec b/tests/modetest/buffers=2Ec
>index 8a8d9e01=2E=2E279d7b28 100644
>--- a/tests/modetest/buffers=2Ec
>+++ b/tests/modetest/buffers=2Ec
>@@ -353,3 +353,22 @@ void bo_destroy(struct bo *bo)
>=20
> 	free(bo);
> }
>+
>+void bo_dump(struct bo *bo, const char *filename)
>+{
>+	FILE *fp;
>+
>+	if (!bo || !filename)
>+		return;
>+
>+	fp =3D fopen(filename, "wb");
>+	if (fp) {
>+		void *addr;
>+
>+		bo_map(bo, &addr);
>+		printf("Dumping buffer %p to file %s=2E\n", bo->ptr, filename);
>+		fwrite(bo->ptr, 1, bo->size, fp);
>+		bo_unmap(bo);
>+		fclose(fp);

Any chance of using libpng, libungif or at the very least implementing min=
imal ppm or bmp support here? Dumping to the image file would help a lot=2E

>+	}
>+}
>diff --git a/tests/modetest/buffers=2Eh b/tests/modetest/buffers=2Eh
>index 7f95396b=2E=2Ecbd54e9e 100644
>--- a/tests/modetest/buffers=2Eh
>+++ b/tests/modetest/buffers=2Eh
>@@ -36,5 +36,6 @@ struct bo *bo_create(int fd, unsigned int format,
> 		   unsigned int handles[4], unsigned int pitches[4],
> 		   unsigned int offsets[4], enum util_fill_pattern pattern);
> void bo_destroy(struct bo *bo);
>+void bo_dump(struct bo *bo, const char *filename);
>=20
> #endif
>diff --git a/tests/modetest/modetest=2Ec b/tests/modetest/modetest=2Ec
>index 2c31c4fc=2E=2E8073d143 100644
>--- a/tests/modetest/modetest=2Ec
>+++ b/tests/modetest/modetest=2Ec
>@@ -68,8 +68,13 @@
> #include "buffers=2Eh"
> #include "cursor=2Eh"
>=20
>+#ifndef ETIME
>+#define ETIME ETIMEDOUT
>+#endif

ETIME is on its way to obsolescence=2E Please use ETIMEDOUT=2E See https:/=
/pubs=2Eopengroup=2Eorg/onlinepubs/9699919799/basedefs/errno=2Eh=2Ehtml

>+
> static enum util_fill_pattern primary_fill =3D UTIL_PATTERN_SMPTE;
> static enum util_fill_pattern secondary_fill =3D UTIL_PATTERN_TILES;
>+static enum util_fill_pattern plain_fill =3D UTIL_PATTERN_PLAIN;
>=20
> struct crtc {
> 	drmModeCrtc *crtc;
>@@ -128,6 +133,7 @@ struct device {
>=20
> 	int use_atomic;
> 	drmModeAtomicReq *req;
>+	int32_t writeback_fence_fd;
> };
>=20
> static inline int64_t U642I64(uint64_t val)
>@@ -135,6 +141,11 @@ static inline int64_t U642I64(uint64_t val)
> 	return (int64_t)*((int64_t *)&val);
> }
>=20
>+static inline uint64_t to_user_pointer(const void *ptr)
>+{
>+	return (uintptr_t)ptr;
>+}
>+
> static float mode_vrefresh(drmModeModeInfo *mode)
> {
> 	return  mode->clock * 1000=2E00
>@@ -811,6 +822,10 @@ struct pipe_arg {
> 	struct crtc *crtc;
> 	unsigned int fb_id[2], current_fb_id;
> 	struct timeval start;
>+	unsigned int out_fb_id;
>+	struct bo *out_bo;
>+	bool custom;
>+	bool dump;
>=20
> 	int swap_count;
> };
>@@ -917,27 +932,43 @@ static struct crtc *pipe_find_crtc(struct device *d=
ev, struct pipe_arg *pipe)
> 	return &dev->resources->crtcs[crtc_idx - 1];
> }
>=20
>+static int parse_mode_string(char *mode_string, drmModeModeInfo *user_mo=
de)
>+{
>+	return sscanf(mode_string, "%u,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu,=
%u,%s",
>+			&user_mode->clock, &user_mode->hdisplay, &user_mode->hsync_start,
>+			&user_mode->hsync_end, &user_mode->htotal, &user_mode->hskew,
>+			&user_mode->vdisplay, &user_mode->vsync_start, &user_mode->vsync_end,
>+			&user_mode->vtotal, &user_mode->vscan, &user_mode->vrefresh,
>+			user_mode->name);
>+}
>+
> static int pipe_find_crtc_and_mode(struct device *dev, struct pipe_arg *=
pipe)

I'd instead rename this to pipe_find_crtc_and_builtin_mode to limit the in=
dent level to remain sane=2E

Then define new function supporting builtin and custom modes=2E

> {
> 	drmModeModeInfo *mode =3D NULL;
> 	int i;
>+	static drmModeModeInfo user_mode;

Minor nit=2E If this a global variable, defining it so is more obvious com=
pared to the hidden static global=2E

>=20
>-	pipe->mode =3D NULL;
>-
>-	for (i =3D 0; i < (int)pipe->num_cons; i++) {
>-		mode =3D connector_find_mode(dev, pipe->con_ids[i],
>-					   pipe->mode_str, pipe->vrefresh);
>-		if (mode =3D=3D NULL) {
>-			if (pipe->vrefresh)
>-				fprintf(stderr,
>-				"failed to find mode "
>-				"\"%s-%=2E2fHz\" for connector %s\n",
>-				pipe->mode_str, pipe->vrefresh, pipe->cons[i]);
>-			else
>-				fprintf(stderr,
>-				"failed to find mode \"%s\" for connector %s\n",
>-				pipe->mode_str, pipe->cons[i]);
>+	if (pipe->custom) {
>+		if (parse_mode_string(pipe->mode_str, &user_mode) =3D=3D 13)
>+			mode =3D &user_mode;
>+		else
> 			return -EINVAL;
>+	} else {
>+		for (i =3D 0; i < (int)pipe->num_cons; i++) {
>+			mode =3D connector_find_mode(dev, pipe->con_ids[i],
>+						   pipe->mode_str, pipe->vrefresh);
>+			if (mode =3D=3D NULL) {
>+				if (pipe->vrefresh)
>+					fprintf(stderr,
>+					"failed to find mode "
>+					"\"%s-%=2E2fHz\" for connector %s\n",
>+					pipe->mode_str, pipe->vrefresh, pipe->cons[i]);
>+				else
>+					fprintf(stderr,
>+					"failed to find mode \"%s\" for connector %s\n",
>+					pipe->mode_str, pipe->cons[i]);
>+				return -EINVAL;
>+			}
> 		}
> 	}
>=20
>@@ -1441,6 +1472,24 @@ static int pipe_resolve_connectors(struct device *=
dev, struct pipe_arg *pipe)
> 	return 0;
> }
>=20
>+static bool pipe_has_writeback_connector(struct device *dev, struct pipe=
_arg *pipes,
>+		unsigned int count)
>+{
>+	drmModeConnector *connector;
>+	unsigned int i, j;
>+
>+	for (j =3D 0; j < count; j++) {
>+		struct pipe_arg *pipe =3D &pipes[j];
>+
>+		for (i =3D 0; i < pipe->num_cons; i++) {
>+			connector =3D get_connector_by_id(dev, pipe->con_ids[i]);
>+			if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK)
>+				return true;
>+		}
>+	}
>+	return false;
>+}
>+
> static int pipe_attempt_connector(struct device *dev, drmModeConnector *=
con,
> 		struct pipe_arg *pipe)
> {
>@@ -1662,6 +1711,70 @@ static void set_mode(struct device *dev, struct pi=
pe_arg *pipes, unsigned int co
> 	}
> }
>=20
>+static void writeback_config(struct device *dev, struct pipe_arg *pipes,=
 unsigned int count)
>+{
>+	drmModeConnector *connector;
>+	unsigned int i, j;
>+
>+	for (j =3D 0; j < count; j++) {
>+		struct pipe_arg *pipe =3D &pipes[j];
>+
>+		for (i =3D 0; i < pipe->num_cons; i++) {
>+			connector =3D get_connector_by_id(dev, pipe->con_ids[i]);
>+			if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK) {
>+				bo_fb_create(dev->fd, pipes[j]=2Efourcc, pipe->mode->hdisplay,
>+					 pipe->mode->vdisplay, plain_fill, &pipe->out_bo,
>+					 &pipe->out_fb_id);
>+				add_property(dev, pipe->con_ids[i], "WRITEBACK_FB_ID",
>+					 pipe->out_fb_id);
>+				add_property(dev, pipe->con_ids[i], "WRITEBACK_OUT_FENCE_PTR",
>+					 to_user_pointer(&dev->writeback_fence_fd));
>+			}
>+		}
>+	}
>+}
>+
>+static int poll_writeback_fence(int fd, int timeout)
>+{
>+	struct pollfd fds =3D { fd, POLLIN };
>+	int ret;
>+
>+	do {
>+		ret =3D poll(&fds, 1, timeout);
>+		if (ret > 0) {
>+			if (fds=2Erevents & (POLLERR | POLLNVAL))
>+				return -EINVAL;
>+
>+			return 0;
>+		} else if (ret =3D=3D 0) {
>+			return -ETIME;
>+		} else {
>+			ret =3D -errno;
>+			if (ret =3D=3D -EINTR || ret =3D=3D -EAGAIN)
>+				continue;
>+			return ret;
>+		}
>+	} while (1);
>+
>+}
>+
>+static void dump_output_fb(struct device *dev, struct pipe_arg *pipes, c=
har *dump_path,
>+			unsigned int count)
>+{
>+	drmModeConnector *connector;
>+	unsigned int i, j;
>+
>+	for (j =3D 0; j < count; j++) {
>+		struct pipe_arg *pipe =3D &pipes[j];
>+
>+		for (i =3D 0; i < pipe->num_cons; i++) {
>+			connector =3D get_connector_by_id(dev, pipe->con_ids[i]);
>+			if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_WRITEBACK)
>+				bo_dump(pipe->out_bo, dump_path);
>+		}
>+	}
>+}
>+
> static void atomic_clear_mode(struct device *dev, struct pipe_arg *pipes=
, unsigned int count)
> {
> 	unsigned int i;
>@@ -1990,7 +2103,7 @@ static void parse_fill_patterns(char *arg)
>=20
> static void usage(char *name)
> {
>-	fprintf(stderr, "usage: %s [-acDdefMPpsCvrw]\n", name);
>+	fprintf(stderr, "usage: %s [-acDdefMPpsCvrwx]\n", name);
>=20
> 	fprintf(stderr, "\n Query options:\n\n");
> 	fprintf(stderr, "\t-c\tlist connectors\n");
>@@ -2000,7 +2113,12 @@ static void usage(char *name)
>=20
> 	fprintf(stderr, "\n Test options:\n\n");
> 	fprintf(stderr, "\t-P <plane_id>@<crtc_id>:<w>x<h>[+<x>+<y>][*<scale>][=
@<format>]\tset a plane\n");
>-	fprintf(stderr, "\t-s <connector_id>[,<connector_id>][@<crtc_id>]:[#<mo=
de index>]<mode>[-<vrefresh>][@<format>]\tset a mode\n");
>+	fprintf(stderr, "\t-s <connector_id>[,<connector_id>][@<crtc_id>]:[#<mo=
de index>]");
>+	fprintf(stderr, "<mode>[-<vrefresh>][@<format>]\tset a built-in mode\n"=
);
>+	fprintf(stderr, "\t-x <connector_id>[@<crtc_id>]:<clock,hdisplay,hsyncs=
tart,hsyncend,");
>+	fprintf(stderr, "htotal,hskew,vdisplay,vsyncstart,vsyncend,vtotal,vscan=
,");

Does this work for non-WB connectors?

>+	fprintf(stderr, "vrefresh,name>\tset a custom mode\n");


>+	fprintf(stderr, "\t-o <desired file path> \t Dump writeback output buff=
er to file\n");
> 	fprintf(stderr, "\t-C\ttest hw cursor\n");
> 	fprintf(stderr, "\t-v\ttest vsynced page flipping\n");
> 	fprintf(stderr, "\t-r\tset the preferred mode for all connectors\n");
>@@ -2017,7 +2135,7 @@ static void usage(char *name)
> 	exit(0);
> }
>=20
>-static char optstr[] =3D "acdD:efF:M:P:ps:Cvrw:";
>+static const char optstr[] =3D "acdD:efF:M:o:P:ps:Cvrw:x:";
>=20
> int main(int argc, char **argv)
> {
>@@ -2040,6 +2158,7 @@ int main(int argc, char **argv)
> 	struct property_arg *prop_args =3D NULL;
> 	unsigned int args =3D 0;
> 	int ret;
>+	char *dump_path;
>=20
> 	memset(&dev, 0, sizeof dev);
>=20
>@@ -2078,6 +2197,10 @@ int main(int argc, char **argv)
> 			/* Preserve the default behaviour of dumping all information=2E */
> 			args--;
> 			break;
>+		case 'o':
>+			pipe_args->dump =3D true;
>+			dump_path =3D optarg;
>+			break;
> 		case 'P':
> 			plane_args =3D realloc(plane_args,
> 					     (plane_count + 1) * sizeof *plane_args);
>@@ -2096,6 +2219,7 @@ int main(int argc, char **argv)
> 			crtcs =3D 1;
> 			planes =3D 1;
> 			break;
>+		case 'x':
> 		case 's':
> 			pipe_args =3D realloc(pipe_args,
> 					    (count + 1) * sizeof *pipe_args);
>@@ -2107,7 +2231,7 @@ int main(int argc, char **argv)
>=20
> 			if (parse_connector(&pipe_args[count], optarg) < 0)
> 				usage(argv[0]);
>-
>+			pipe_args->custom =3D (c =3D=3D 'x');
> 			count++;
> 			break;
> 		case 'C':
>@@ -2163,6 +2287,7 @@ int main(int argc, char **argv)
>=20
> 	if (use_atomic) {
> 		ret =3D drmSetClientCap(dev=2Efd, DRM_CLIENT_CAP_ATOMIC, 1);
>+		drmSetClientCap(dev=2Efd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);

Only if dump was requested?


> 		if (ret) {
> 			fprintf(stderr, "no atomic modesetting support: %s\n", strerror(errno=
));
> 			drmClose(dev=2Efd);
>@@ -2206,6 +2331,12 @@ int main(int argc, char **argv)
> 			if (set_preferred || count)
> 				set_mode(&dev, pipe_args, count);
>=20
>+			if (pipe_has_writeback_connector(&dev, pipe_args, count))
>+				writeback_config(&dev, pipe_args, count);
>+			else if (pipe_args->dump)
>+				fprintf(stderr,
>+						"No writeback connector found - dump will be skipped=2E\n");
>+
> 			if (plane_count)
> 				atomic_set_planes(&dev, plane_args, plane_count, false);
>=20
>@@ -2215,6 +2346,20 @@ int main(int argc, char **argv)
> 				return 1;
> 			}
>=20
>+			/*
>+			 * Since only writeback connectors have an output fb, this should onl=
y be
>+			 * called for writeback=2E
>+			 */
>+			if (pipe_has_writeback_connector(&dev, pipe_args, count)) {
>+				ret =3D poll_writeback_fence(dev=2Ewriteback_fence_fd, 1000);
>+				if (ret)
>+					fprintf(stderr,
>+							"Poll for writeback error: %d=2E Skipping Dump=2E\n",
>+							ret);
>+				else if (pipe_args->dump)
>+					dump_output_fb(&dev, pipe_args, dump_path, count);
>+			}
>+
> 			if (test_vsync)
> 				atomic_test_page_flip(&dev, pipe_args, plane_args, plane_count);
>=20

--=20
With best wishes
Dmitry
